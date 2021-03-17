//
//  AuthRequiredBoard.swift
//  HelloBoardy
//
//  Created by FOLY on 3/17/21.
//

import Boardy
import Foundation
import UIKit

final class AuthRequiredBoard: ContinuousBoard, GuaranteedBoard {
    typealias InputType = BoardInputModel

    private let service: Authenticating

    private var pendingTarget: InputType?

    init(identifier: BoardID = .authRequired,
         service: Authenticating,
         motherboard: FlowMotherboard) {
        self.service = service
        super.init(identifier: identifier, motherboard: motherboard)
        registerFlows()
    }

    func activate(withGuaranteedInput input: InputType) {
        if service.isAuthenticated {
            nextToBoard(model: input)
        } else {
            pendingTarget = input
            continueBoard(.authentication)
        }
    }

    private func registerFlows() {
        motherboard.registerGuaranteedFlow(matchedIdentifiers: .authentication, target: self, uniqueOutputType: String.self) { target, output in
            target.sendToMotherboard(data: output)
            target.activatePendingTarget()
        }
    }

    private func activatePendingTarget() {
        guard let target = pendingTarget else { return }
        nextToBoard(model: target)
    }
}
