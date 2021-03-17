//
//  BoardIdentities.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//

import Boardy
import Foundation

extension BoardID {
    static let login: BoardID = "com.ex.login"
    static let register: BoardID = "com.ex.register"
    static let authentication: BoardID = "com.ex.auth"
    static let home: BoardID = "com.ex.home"
    static let authRequired: BoardID = "com.ex.auth-required"
    static let web: BoardID = "com.ex.web"
    static let gitHubSearch: BoardID = "com.ex.git-hub-search"
}

extension BoardInput {
    static var login: BoardInput<Void> {
        BoardInput<Void>(target: .login)
    }

    static var register: BoardInput<Void> {
        BoardInput<Void>(target: .register)
    }

    static var authentication: BoardInput<Void> {
        BoardInput<Void>(target: .authentication)
    }

    static func authRequired<TargetInput>(target: BoardInput<TargetInput>) -> BoardInput<BoardInput<TargetInput>> {
        BoardInput<BoardInput<TargetInput>>(target: .authRequired, input: target)
    }

    static var home: BoardInput<Void> {
        BoardInput<Void>(target: .home)
    }

    static func web(_ input: WebInput) -> BoardInput<WebInput> {
        BoardInput<WebInput>(target: .web, input: input)
    }

    static var gitHubSearch: BoardInput<Void> {
        BoardInput<Void>(target: .gitHubSearch)
    }
}

enum ReturnAction: BoardFlowAction {
    case home
}
