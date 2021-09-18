//
//  HomeViewController.swift
//  Home
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import UIKit

/// Use for interacting with data before sending messages to outside
protocol HomeInteractable {
    func didBecomeActive()
}

final class HomeViewController: UIViewController {
    // MARK: Dependencies

    weak var delegate: HomeActionDelegate?

    var interactor: HomeInteractable!

    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor.didBecomeActive()
    }

    // MARK: Private computed & temporary properties

    // MARK: IBOutlets / IBActions

    @IBOutlet private var welcomeLabel: UILabel!
    @IBOutlet private var loginButton: UIButton!
    @IBOutlet private var searchButton: UIButton!
    @IBOutlet private var logoutBarButtonItem: UIBarButtonItem!

    @IBAction private func logoutButtonDidTap() {
        delegate?.performLogout()
    }

    @IBAction private func loginButtonDidTap() {
        delegate?.openLogin()
    }

    @IBAction private func searchButtonDidTap() {
        delegate?.openGitHubSearch()
    }
}

// MARK: - Behaviors

extension HomeViewController: HomeViewable {
    func bind(viewModel: HomeViewModel) {
        welcomeLabel.isHidden = !viewModel.isLoggedIn
        loginButton.isHidden = viewModel.isLoggedIn
        navigationItem.rightBarButtonItems = !viewModel.isLoggedIn ? [] : [logoutBarButtonItem]
        welcomeLabel.text = viewModel.greetingMessage
    }
}

// MARK: - Private methods

private extension HomeViewController {
    func setupView() {}
}
