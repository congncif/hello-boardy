//
//  GitHubSearchViewState.swift
//  HelloBoardy
//
//  Created by FOLY on 3/17/21.
//
//

import Foundation
import ViewStateCore

final class UserViewModel: NSObject {
    let avatar: String
    let username: String
    let home: String

    init(avatar: String, username: String, home: String) {
        self.avatar = avatar
        self.username = username
        self.home = home
    }
}

final class GitHubSearchViewState: ViewState {
    @objc dynamic var users: [UserViewModel] = []
}
