//
//  LogoutIOInterface.swift
//  HelloAuthIO
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let pubLogout: BoardID = "pub.mod.Logout"   
}

// MARK: - Interface

public struct LogoutDestination {
    public let activation: BoardActivation<LogoutParameter>
    public let interaction: BoardInteraction<LogoutCommand>

    public static let defaultIdentifier: BoardID = .pubLogout
}

extension ActivatableBoard {
    public func ioLogout(_ identifier: BoardID = LogoutDestination.defaultIdentifier) -> LogoutDestination {
        LogoutDestination(
            activation: activation(identifier, with: LogoutParameter.self),
            interaction: interaction(identifier, with: LogoutCommand.self)
        )
    }
}

public struct LogoutMainDestination {
    public let activation: MainboardActivation<LogoutParameter>
    public let interaction: MainboardInteraction<LogoutCommand>
    public let flow: FlowHandler<LogoutOutput>

    public static let defaultIdentifier: BoardID = .pubLogout
}

extension MotherboardType where Self: FlowManageable {
    public func ioLogout(_ identifier: BoardID = LogoutMainDestination.defaultIdentifier) -> LogoutMainDestination {
        LogoutMainDestination(
            activation: activation(identifier, with: LogoutParameter.self),
            interaction: interaction(identifier, with: LogoutCommand.self),
            flow: matchedFlow(identifier, with: LogoutOutput.self)
        )
    }
}
