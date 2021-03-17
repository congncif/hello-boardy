//
//  AuthenticationBoard.swift
//  HelloBoardy
//
//  Created by FOLY on 3/17/21.
//

import Boardy
import Foundation
import UIKit

final class AuthenticationBoard: ContinuousBoard, GuaranteedBoard {
    typealias InputType = Any

    override init(identifier: BoardID = .authentication,
                  motherboard: FlowMotherboard) {
        super.init(identifier: identifier, motherboard: motherboard)
        registerFlows()
    }

    func activate(withGuaranteedInput input: InputType) {
        continueBoard(.login)
    }

    private func registerFlows() {
        motherboard.registerGuaranteedFlow(matchedIdentifiers: .login, .register, target: self, uniqueOutputType: String.self) { target, user in
            target.authenticatedSuccessfully(with: user)
        }
    }

    private func authenticatedSuccessfully(with user: String) {
        rootViewController.returnHere(animated: true) { [unowned self] in
            self.sendToMotherboard(data: user)
        }
    }
}
