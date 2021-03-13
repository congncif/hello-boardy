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
    static let home: BoardID = "com.ex.home"
}

extension BoardInput {
    static var login: BoardInput<Void> {
        BoardInput<Void>(target: .login)
    }

    static var register: BoardInput<Void> {
        BoardInput<Void>(target: .register)
    }

    static func home(user: String) -> BoardInput<String> {
        BoardInput<String>(target: .home, input: user)
    }
}
