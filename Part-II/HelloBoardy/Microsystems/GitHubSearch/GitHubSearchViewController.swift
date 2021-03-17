//
//  GitHubSearchViewController.swift
//  HelloBoardy
//
//  Created by FOLY on 3/17/21.
//
//

import SDWebImage
import SiFUtilities
import TinyInjector
import UIKit
import ViewStateCore

final class GitHubSearchViewController: UIViewController, GitHubSearchController {
    // MARK: Dependencies

    weak var delegate: GitHubSearchDelegate?

    lazy var state = GitHubSearchViewState()

    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        state.register(subscriberObject: self)
    }

    override func viewDidDisplay() {
        loadData()
    }

    // MARK: Private computed & temporary properties

    @LazyInjected var searchService: GitHubSearching

    // MARK: IBOutlets / IBActions

    @IBOutlet private var tableView: UITableView!
}

// MARK: - Behaviors

extension GitHubSearchViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let model = state.users[indexPath.row]

        let imageView = cell.viewWithTag(1) as? UIImageView
        let url = URL(string: model.avatar)
        imageView?.sd_setImage(with: url)

        let titleLabel = cell.viewWithTag(2) as? UILabel
        titleLabel?.text = model.username

        let homeLabel = cell.viewWithTag(3) as? UILabel
        homeLabel?.text = model.home

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = state.users[indexPath.row]
        delegate?.openWebBrowser(withTitle: model.username, link: model.home)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - ViewState

extension GitHubSearchViewController: DedicatedViewStateRenderable {
    func dedicatedRender(state: GitHubSearchViewState) {
        tableView.reloadData()
    }
}

// MARK: - Private methods

private extension GitHubSearchViewController {
    func loadData() {
        let query = "Apple"
        showLoading()
        searchService.searchUsers(query: query) { [unowned self] result in
            self.hideLoading()
            guard let users = try? result.get() else { return }
            self.state.users = users.map { UserViewModel(avatar: $0.avatarUrl, username: $0.username, home: $0.homeUrl) }
        }
    }
}
