//
//  RegisterBoard.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Boardy
import Foundation
import UIKit

final class RegisterBoard: ModernContinuableBoard, GuaranteedBoard, GuaranteedOutputSendingBoard {
    typealias InputType = RegisterInput
    typealias OutputType = RegisterOutput

    private let builder: RegisterBuildable

    init(identifier: BoardID, builder: RegisterBuildable, producer: ActivableBoardProducer) {
        self.builder = builder
        super.init(identifier: identifier, boardProducer: producer)
        registerFlows()
    }

    func activate(withGuaranteedInput input: InputType) {
        let component = builder.build(withDelegate: self)
        let viewController = component.userInterface
        motherboard.putIntoContext(viewController)
        rootViewController.show(viewController)
    }
}

extension RegisterBoard: RegisterDelegate {
    func performRegister(username: String, password: String) {
        motherboard.ioSignUp().activation.activate(with: SignUpParameter(username: username, password: password))
    }

    func didBecomeActive() {}
}

private extension RegisterBoard {
    func registerFlows() {
        motherboard.ioSignUp().flow.sendOutput(through: self)
    }
}
