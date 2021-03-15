//
//  LoginBoard.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import Boardy
import Foundation
import UIKit

final class LoginBoard: Board, GuaranteedBoard {
    typealias InputType = Any

    private let builder: LoginBuildable

    init(builder: LoginBuildable) {
        self.builder = builder
        super.init(identifier: .login)
    }

    func activate(withGuaranteedInput input: InputType) {
        let viewController = builder.build(withDelegate: self)
        window.setRootViewController(viewController)
    }
}

extension LoginBoard: LoginDelegate {
    func loggedInSuccessfully(user: String) {
        nextToBoard(.home(user: user))
    }

    func openRegister() {
        nextToBoard(.register)
    }
}
