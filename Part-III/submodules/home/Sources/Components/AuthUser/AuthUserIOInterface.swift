//
//  AuthUserIOInterface.swift
//  Home
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let modAuthUser: BoardID = "mod.Home.AuthUser"
}

// MARK: - Interface

struct AuthUserDestination {
    let activation: BoardActivation<AuthUserParameter>
    let interaction: BoardInteraction<AuthUserCommand>
}

extension ActivatableBoard {
    func ioAuthUser(_ identifier: BoardID = .modAuthUser) -> AuthUserDestination {
        AuthUserDestination(
            activation: activation(identifier, with: AuthUserParameter.self),
            interaction: interaction(identifier, with: AuthUserCommand.self)
        )
    }
}

struct AuthUserMainDestination {
    let activation: MainboardActivation<AuthUserParameter>
    let interaction: MainboardInteraction<AuthUserCommand>
    let flow: FlowHandler<AuthUserOutput>
}

extension MotherboardType where Self: FlowManageable {
    func ioAuthUser(_ identifier: BoardID = .modAuthUser) -> AuthUserMainDestination {
        AuthUserMainDestination(
            activation: activation(identifier, with: AuthUserParameter.self),
            interaction: interaction(identifier, with: AuthUserCommand.self),
            flow: matchedFlow(identifier, with: AuthUserOutput.self)
        )
    }
}
