//
//  GitHubSearchController.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Foundation

protocol GitHubSearchViewable: AnyObject {
    func bind(users: [UserViewModel])
}

final class GitHubSearchController {
    weak var delegate: GitHubSearchControlDelegate?
    weak var view: GitHubSearchViewable!

    private var users: [GitHubUser] = [] {
        didSet {
            view.bind(users: users.map {
                UserViewModel(avatarURL: URL(string: $0.avatarUrl), name: $0.username, homePage: $0.homeUrl)
            })
        }
    }
}

extension GitHubSearchController: GitHubSearchInteractable {
    func didBecomeActive() {
        delegate?.didBecomeActive()
    }
    
    func resultDidSelect(at index: Int) {
        delegate?.userDidSelect(users[index])
    }
}

extension GitHubSearchController: GitHubSearchControllable {
    func update(users: [GitHubUser]) {
        self.users = users
    }
}

// MARK: - View Model

struct UserViewModel {
    let avatarURL: URL?
    let name: String
    let homePage: String
}
