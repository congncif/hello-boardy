//
//  HomeViewController.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import TinyInjector
import UIKit
import ViewStateCore

final class HomeViewController: UIViewController, HomeController {
    // MARK: Dependencies

    weak var delegate: HomeDelegate?

    lazy var state = HomeViewState()

    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        state.register(subscriberObject: self)
    }

    // MARK: Privates

    @LazyInjected var authService: Authenticating

    @IBOutlet private var welcomeLabel: UILabel!
    @IBOutlet private var loginButton: UIButton!
    @IBOutlet private var searchButton: UIButton!
    @IBOutlet private var logoutBarButtonItem: UIBarButtonItem!

    @IBAction private func logoutButtonDidTap() {
        confirm(message: "Are you sure?") { [weak self] in
            // Process logout, clear data, etc
            self?.authService.quit()
            self?.reloadData()
        }
    }

    @IBAction private func loginButtonDidTap() {
        delegate?.openLogin()
    }

    @IBAction private func searchButtonDidTap() {
        delegate?.openGitHubSearch()
    }
}

// MARK: - Behaviors

extension HomeViewController {
    func reloadData() {
        state.currentUser = authService.currentUser
    }
}

// MARK: - ViewState

extension HomeViewController: DedicatedViewStateFillable {
    func dedicatedFillingOptions(_ state: HomeViewState) -> [FillingOption] {
        let currentUserKey = #keyPath(HomeViewState.currentUser)

        return [
            O2O(keyPath: currentUserKey, filling: { [unowned self] in
                let value: Any? = $0 is NSNull ? nil : $0
                let isInvalid = value == nil
                self.welcomeLabel.isHidden = isInvalid
                self.loginButton.isHidden = !isInvalid
                self.navigationItem.rightBarButtonItems = isInvalid ? [] : [self.logoutBarButtonItem]
                guard let text = value else { return }
                self.welcomeLabel.text = "Welcome, \(text)!"
            })
        ]
    }
}
