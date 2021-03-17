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
        rootViewController.returnHere { [unowned self] in
            let viewController = self.builder.build(withDelegate: self)
            self.rootViewController.show(viewController) {
                $0.style = .present(.embeddedInNavigationFullScreen)
            }
        }
    }
}

extension RegisterBoard: RegisterDelegate {
    func registeredSuccessfully(user: String) {
        sendToMotherboard(data: user)
    }

    func openLogin() {
        nextToBoard(.login)
    }
}
