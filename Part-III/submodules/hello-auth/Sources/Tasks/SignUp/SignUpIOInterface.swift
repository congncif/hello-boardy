//
//  SignUpIOInterface.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let modSignUp: BoardID = "mod.HelloAuth.SignUp"
}

// MARK: - Interface

struct SignUpDestination {
    let activation: BoardActivation<SignUpParameter>
    let interaction: BoardInteraction<SignUpCommand>
}

extension ActivatableBoard {
    func ioSignUp(_ identifier: BoardID = .modSignUp) -> SignUpDestination {
        SignUpDestination(
            activation: activation(identifier, with: SignUpParameter.self),
            interaction: interaction(identifier, with: SignUpCommand.self)
        )
    }
}

struct SignUpMainDestination {
    let activation: MainboardActivation<SignUpParameter>
    let interaction: MainboardInteraction<SignUpCommand>
    let flow: FlowHandler<SignUpOutput>
}

extension MotherboardType where Self: FlowManageable {
    func ioSignUp(_ identifier: BoardID = .modSignUp) -> SignUpMainDestination {
        SignUpMainDestination(
            activation: activation(identifier, with: SignUpParameter.self),
            interaction: interaction(identifier, with: SignUpCommand.self),
            flow: matchedFlow(identifier, with: SignUpOutput.self)
        )
    }
}
