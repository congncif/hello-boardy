//
//  SignOnUserIOInterface.swift
//  HelloAuthIO
//
//  Created by NGUYEN CHI CONG on 9/19/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let pubSignOnUser: BoardID = "pub.mod.SignOnUser"   
}

// MARK: - Interface

public struct SignOnUserDestination {
    public let activation: BoardActivation<SignOnUserParameter>
    public let interaction: BoardInteraction<SignOnUserCommand>

    public static let defaultIdentifier: BoardID = .pubSignOnUser
}

extension ActivatableBoard {
    public func ioSignOnUser(_ identifier: BoardID = SignOnUserDestination.defaultIdentifier) -> SignOnUserDestination {
        SignOnUserDestination(
            activation: activation(identifier, with: SignOnUserParameter.self),
            interaction: interaction(identifier, with: SignOnUserCommand.self)
        )
    }
}

public struct SignOnUserMainDestination {
    public let activation: MainboardActivation<SignOnUserParameter>
    public let interaction: MainboardInteraction<SignOnUserCommand>
    public let flow: FlowHandler<SignOnUserOutput>

    public static let defaultIdentifier: BoardID = .pubSignOnUser
}

extension MotherboardType where Self: FlowManageable {
    public func ioSignOnUser(_ identifier: BoardID = SignOnUserMainDestination.defaultIdentifier) -> SignOnUserMainDestination {
        SignOnUserMainDestination(
            activation: activation(identifier, with: SignOnUserParameter.self),
            interaction: interaction(identifier, with: SignOnUserCommand.self),
            flow: matchedFlow(identifier, with: SignOnUserOutput.self)
        )
    }
}
