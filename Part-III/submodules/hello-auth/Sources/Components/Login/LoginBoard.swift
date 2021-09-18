//
//  LoginBoard.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Boardy
import Foundation
import UIKit

final class LoginBoard: ModernContinuableBoard, GuaranteedBoard, GuaranteedOutputSendingBoard {
    typealias InputType = LoginInput
    typealias OutputType = LoginOutput

    private let builder: LoginBuildable

    init(identifier: BoardID, builder: LoginBuildable, producer: ActivableBoardProducer) {
        self.builder = builder
        super.init(identifier: identifier, boardProducer: producer)
        registerFlows()
    }

    func activate(withGuaranteedInput input: InputType) {
        let component = builder.build(withDelegate: self)
        let viewController = component.userInterface
        motherboard.putIntoContext(viewController)
        rootViewController.show(viewController) {
            $0.style = .defaultPresent
        }
    }
}

extension LoginBoard: LoginDelegate {
    func didBecomeActive() {}

    func openRegister() {
        motherboard.ioRegister().activation.activate()
    }

    func performLogin(username: String, password: String) {
        motherboard.ioSignIn().activation.activate(with: SignInParameter(username: username, password: password))
    }
    
    func loginDidClose() {
        sendOutput(.userClosed)
    }
}

private extension LoginBoard {
    func registerFlows() {
        motherboard.ioSignIn().flow.addTarget(self) { board, user in
            board.rootViewController.returnHere()
            board.sendOutput(.authenticated(user))
        }

        motherboard.ioRegister().flow.addTarget(self) { board, user in
            board.rootViewController.returnHere()
            board.sendOutput(.authenticated(user))
        }
    }
}
