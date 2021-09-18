//
//  LoginIOInterface.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let modLogin: BoardID = "mod.HelloAuth.Login"
}

// MARK: - Interface

struct LoginDestination {
    let activation: BoardActivation<LoginParameter>
    let interaction: BoardInteraction<LoginCommand>
}

extension ActivatableBoard {
    func ioLogin(_ identifier: BoardID = .modLogin) -> LoginDestination {
        LoginDestination(
            activation: activation(identifier, with: LoginParameter.self),
            interaction: interaction(identifier, with: LoginCommand.self)
        )
    }
}

struct LoginMainDestination {
    let activation: MainboardActivation<LoginParameter>
    let interaction: MainboardInteraction<LoginCommand>
    let flow: FlowHandler<LoginOutput>
}

extension MotherboardType where Self: FlowManageable {
    func ioLogin(_ identifier: BoardID = .modLogin) -> LoginMainDestination {
        LoginMainDestination(
            activation: activation(identifier, with: LoginParameter.self),
            interaction: interaction(identifier, with: LoginCommand.self),
            flow: matchedFlow(identifier, with: LoginOutput.self)
        )
    }
}
