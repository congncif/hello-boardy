//
//  CurrentUserIOInterface.swift
//  HelloAuthIO
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let pubCurrentUser: BoardID = "pub.mod.CurrentUser"   
}

// MARK: - Interface

public struct CurrentUserDestination {
    public let activation: BoardActivation<CurrentUserParameter>
    public let interaction: BoardInteraction<CurrentUserCommand>

    public static let defaultIdentifier: BoardID = .pubCurrentUser
}

extension ActivatableBoard {
    public func ioCurrentUser(_ identifier: BoardID = CurrentUserDestination.defaultIdentifier) -> CurrentUserDestination {
        CurrentUserDestination(
            activation: activation(identifier, with: CurrentUserParameter.self),
            interaction: interaction(identifier, with: CurrentUserCommand.self)
        )
    }
}

public struct CurrentUserMainDestination {
    public let activation: MainboardActivation<CurrentUserParameter>
    public let interaction: MainboardInteraction<CurrentUserCommand>
    public let flow: FlowHandler<CurrentUserOutput>

    public static let defaultIdentifier: BoardID = .pubCurrentUser
}

extension MotherboardType where Self: FlowManageable {
    public func ioCurrentUser(_ identifier: BoardID = CurrentUserMainDestination.defaultIdentifier) -> CurrentUserMainDestination {
        CurrentUserMainDestination(
            activation: activation(identifier, with: CurrentUserParameter.self),
            interaction: interaction(identifier, with: CurrentUserCommand.self),
            flow: matchedFlow(identifier, with: CurrentUserOutput.self)
        )
    }
}
