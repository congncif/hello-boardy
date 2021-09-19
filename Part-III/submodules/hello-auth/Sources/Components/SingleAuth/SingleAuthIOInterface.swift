//
//  SingleAuthIOInterface.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/19/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let modSingleAuth: BoardID = "mod.HelloAuth.SingleAuth"
}

// MARK: - Interface

struct SingleAuthDestination {
    let activation: BoardActivation<SingleAuthParameter>
    let interaction: BoardInteraction<SingleAuthCommand>
}

extension ActivatableBoard {
    func ioSingleAuth(_ identifier: BoardID = .modSingleAuth) -> SingleAuthDestination {
        SingleAuthDestination(
            activation: activation(identifier, with: SingleAuthParameter.self),
            interaction: interaction(identifier, with: SingleAuthCommand.self)
        )
    }
}

struct SingleAuthMainDestination {
    let activation: MainboardActivation<SingleAuthParameter>
    let interaction: MainboardInteraction<SingleAuthCommand>
    let flow: FlowHandler<SingleAuthOutput>
}

extension MotherboardType where Self: FlowManageable {
    func ioSingleAuth(_ identifier: BoardID = .modSingleAuth) -> SingleAuthMainDestination {
        SingleAuthMainDestination(
            activation: activation(identifier, with: SingleAuthParameter.self),
            interaction: interaction(identifier, with: SingleAuthCommand.self),
            flow: matchedFlow(identifier, with: SingleAuthOutput.self)
        )
    }
}
