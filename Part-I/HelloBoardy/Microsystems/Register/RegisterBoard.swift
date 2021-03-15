//
//  RegisterBoard.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import Boardy
import Foundation
import UIKit

final class RegisterBoard: Board, GuaranteedBoard {
    typealias InputType = Any

    private let builder: RegisterBuildable

    init(builder: RegisterBuildable) {
        self.builder = builder
        super.init(identifier: .register)
    }

    func activate(withGuaranteedInput input: InputType) {
        let viewController = builder.build(withDelegate: self)
        window.setRootViewController(viewController)
    }
}

extension RegisterBoard: RegisterDelegate {
    func registeredSuccessfully(user: String) {
        nextToBoard(.home(user: user))
    }

    func openLogin() {
        nextToBoard(.login)
    }
}
