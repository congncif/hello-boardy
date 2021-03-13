//
//  HomeViewController.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

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

    @IBOutlet private var welcomeLabel: UILabel!

    @IBAction private func logoutButtonDidTap() {
        confirm(message: "Are you sure?") { [weak delegate] in
            // Process logout, clear data, etc
            delegate?.openLogin()
        }
    }
}

// MARK: - Behaviors

extension HomeViewController {
    func withUser(_ user: String) {
        state.currentUser = user
    }
}

// MARK: - ViewState

extension HomeViewController: DedicatedViewStateFillable {
    func dedicatedFillingOptions(_ state: HomeViewState) -> [FillingOption] {
        let currentUserKey = #keyPath(HomeViewState.currentUser)
        let textKey = #keyPath(UILabel.text)

        return [
            O2O(currentUserKey, welcomeLabel, textKey) {
                guard let text = $0 else { return nil }
                return "Welcome, \(text)!"
            }
        ]
    }
}
