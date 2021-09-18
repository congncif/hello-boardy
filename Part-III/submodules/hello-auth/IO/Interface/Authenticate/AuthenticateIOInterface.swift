//
//  AuthenticateIOInterface.swift
//  HelloAuthIO
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let pubAuthenticate: BoardID = "pub.mod.Authenticate"   
}

// MARK: - Interface

public struct AuthenticateDestination {
    public let activation: BoardActivation<AuthenticateParameter>
    public let interaction: BoardInteraction<AuthenticateCommand>

    public static let defaultIdentifier: BoardID = .pubAuthenticate
}

extension ActivatableBoard {
    public func ioAuthenticate(_ identifier: BoardID = AuthenticateDestination.defaultIdentifier) -> AuthenticateDestination {
        AuthenticateDestination(
            activation: activation(identifier, with: AuthenticateParameter.self),
            interaction: interaction(identifier, with: AuthenticateCommand.self)
        )
    }
}

public struct AuthenticateMainDestination {
    public let activation: MainboardActivation<AuthenticateParameter>
    public let interaction: MainboardInteraction<AuthenticateCommand>
    public let flow: FlowHandler<AuthenticateOutput>

    public static let defaultIdentifier: BoardID = .pubAuthenticate
}

extension MotherboardType where Self: FlowManageable {
    public func ioAuthenticate(_ identifier: BoardID = AuthenticateMainDestination.defaultIdentifier) -> AuthenticateMainDestination {
        AuthenticateMainDestination(
            activation: activation(identifier, with: AuthenticateParameter.self),
            interaction: interaction(identifier, with: AuthenticateCommand.self),
            flow: matchedFlow(identifier, with: AuthenticateOutput.self)
        )
    }
}
