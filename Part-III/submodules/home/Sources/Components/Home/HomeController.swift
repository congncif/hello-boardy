//
//  HomeController.swift
//  Home
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Foundation
import HelloAuthIO

protocol HomeViewable: AnyObject {
    func bind(viewModel: HomeViewModel)
}

final class HomeController {
    weak var delegate: HomeControlDelegate?
    weak var view: HomeViewable!

    private var currentUser: AuthUser? {
        didSet {
            guard let user = currentUser else {
                view.bind(viewModel: HomeViewModel(greetingMessage: "", isLoggedIn: false))
                return
            }
            view.bind(viewModel: HomeViewModel(greetingMessage: "Welcome, \(user.name)", isLoggedIn: true))
        }
    }
}

extension HomeController: HomeInteractable {
    func didBecomeActive() {
        delegate?.didBecomeActive()
    }
}

extension HomeController: HomeControllable {
    func updateUser(_ currentUser: AuthUser?) {
        self.currentUser = currentUser
    }
}

// MARK: - View Model

struct HomeViewModel {
    let greetingMessage: String
    let isLoggedIn: Bool
}
