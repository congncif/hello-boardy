//
//  SignOutIOInterface.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let modSignOut: BoardID = "mod.HelloAuth.SignOut"
}

// MARK: - Interface

struct SignOutDestination {
    let activation: BoardActivation<SignOutParameter>
    let interaction: BoardInteraction<SignOutCommand>
}

extension ActivatableBoard {
    func ioSignOut(_ identifier: BoardID = .modSignOut) -> SignOutDestination {
        SignOutDestination(
            activation: activation(identifier, with: SignOutParameter.self),
            interaction: interaction(identifier, with: SignOutCommand.self)
        )
    }
}

struct SignOutMainDestination {
    let activation: MainboardActivation<SignOutParameter>
    let interaction: MainboardInteraction<SignOutCommand>
    let flow: FlowHandler<SignOutOutput>
}

extension MotherboardType where Self: FlowManageable {
    func ioSignOut(_ identifier: BoardID = .modSignOut) -> SignOutMainDestination {
        SignOutMainDestination(
            activation: activation(identifier, with: SignOutParameter.self),
            interaction: interaction(identifier, with: SignOutCommand.self),
            flow: matchedFlow(identifier, with: SignOutOutput.self)
        )
    }
}
