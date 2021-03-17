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
        rootViewController.returnHere { [unowned self] in
            let viewController = self.builder.build(withDelegate: self)
            self.rootViewController.show(viewController) {
                $0.style = .present(.embeddedInNavigationFullScreen)
            }
        }
    }
}

extension LoginBoard: LoginDelegate {
    func loggedInSuccessfully(user: String) {
        sendToMotherboard(data: user)
    }

    func openRegister() {
        nextToBoard(.register)
    }
}
