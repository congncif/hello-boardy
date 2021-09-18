//
//  RegisterIOInterface.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let modRegister: BoardID = "mod.HelloAuth.Register"
}

// MARK: - Interface

struct RegisterDestination {
    let activation: BoardActivation<RegisterParameter>
    let interaction: BoardInteraction<RegisterCommand>
}

extension ActivatableBoard {
    func ioRegister(_ identifier: BoardID = .modRegister) -> RegisterDestination {
        RegisterDestination(
            activation: activation(identifier, with: RegisterParameter.self),
            interaction: interaction(identifier, with: RegisterCommand.self)
        )
    }
}

struct RegisterMainDestination {
    let activation: MainboardActivation<RegisterParameter>
    let interaction: MainboardInteraction<RegisterCommand>
    let flow: FlowHandler<RegisterOutput>
}

extension MotherboardType where Self: FlowManageable {
    func ioRegister(_ identifier: BoardID = .modRegister) -> RegisterMainDestination {
        RegisterMainDestination(
            activation: activation(identifier, with: RegisterParameter.self),
            interaction: interaction(identifier, with: RegisterCommand.self),
            flow: matchedFlow(identifier, with: RegisterOutput.self)
        )
    }
}
