//
//  RootBoard.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import Boardy
import Foundation
import UIKit

final class RootBoard: ContinuousBoard, GuaranteedBoard {
    typealias InputType = Any

    init(motherboard: FlowMotherboard) {
        super.init(motherboard: motherboard)
        registerFlows()
    }

    func activate(withGuaranteedInput input: InputType) {
        continueBoard(.login)
    }

    private func registerFlows() {
        motherboard.registerGuaranteedFlow(matchedIdentifiers: .login, target: self, uniqueOutputType: String.self) { target, output in
            target.continueBoard(.home(user: output))
        }
    }
}
