//
//  GitHubSearchViewController.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import UIKit

/// Use for interacting with data before sending messages to outside
protocol GitHubSearchInteractable {
    func didBecomeActive()
    func resultDidSelect(at index: Int)
}

final class GitHubSearchViewController: UIViewController {
    // MARK: Dependencies

    weak var delegate: GitHubSearchActionDelegate?

    var interactor: GitHubSearchInteractable!

    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor.didBecomeActive()
    }

    // MARK: Private computed & temporary properties

    private lazy var users: [UserViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: IBOutlets / IBActions

    @IBOutlet private var tableView: UITableView!
}

// MARK: - Behaviors

extension GitHubSearchViewController: GitHubSearchViewable {
    func bind(users: [UserViewModel]) {
        self.users = users
    }
}

extension GitHubSearchViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GHUserTableViewCell.typeName, for: indexPath) as! GHUserTableViewCell
        cell.bind(users[indexPath.row])
        let model = users[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.resultDidSelect(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Private methods

private extension GitHubSearchViewController {
    func setupView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}
