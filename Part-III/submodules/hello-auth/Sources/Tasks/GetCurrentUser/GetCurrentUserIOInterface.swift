//
//  GetCurrentUserIOInterface.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let modGetCurrentUser: BoardID = "mod.HelloAuth.GetCurrentUser"
}

// MARK: - Interface

struct GetCurrentUserDestination {
    let activation: BoardActivation<GetCurrentUserParameter>
    let interaction: BoardInteraction<GetCurrentUserCommand>
}

extension ActivatableBoard {
    func ioGetCurrentUser(_ identifier: BoardID = .modGetCurrentUser) -> GetCurrentUserDestination {
        GetCurrentUserDestination(
            activation: activation(identifier, with: GetCurrentUserParameter.self),
            interaction: interaction(identifier, with: GetCurrentUserCommand.self)
        )
    }
}

struct GetCurrentUserMainDestination {
    let activation: MainboardActivation<GetCurrentUserParameter>
    let interaction: MainboardInteraction<GetCurrentUserCommand>
    let flow: FlowHandler<GetCurrentUserOutput>
}

extension MotherboardType where Self: FlowManageable {
    func ioGetCurrentUser(_ identifier: BoardID = .modGetCurrentUser) -> GetCurrentUserMainDestination {
        GetCurrentUserMainDestination(
            activation: activation(identifier, with: GetCurrentUserParameter.self),
            interaction: interaction(identifier, with: GetCurrentUserCommand.self),
            flow: matchedFlow(identifier, with: GetCurrentUserOutput.self)
        )
    }
}
