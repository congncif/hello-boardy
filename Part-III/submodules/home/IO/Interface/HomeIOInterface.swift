//
//  HomeIOInterface.swift
//  Home
//
//  Created by Boardy on 6/1/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let pubHome: BoardID = "pub.mod.Home"   
}

// MARK: - Interface

public struct HomeDestination {
    public let activation: BoardActivation<HomeParameter>
    public let interaction: BoardInteraction<HomeCommand>

    public static let defaultIdentifier: BoardID = .pubHome
}

extension ActivatableBoard {
    public func ioHome(_ identifier: BoardID = HomeDestination.defaultIdentifier) -> HomeDestination {
        HomeDestination(
            activation: activation(identifier, with: HomeParameter.self),
            interaction: interaction(identifier, with: HomeCommand.self)
        )
    }
}

public struct HomeMainDestination {
    public let activation: MainboardActivation<HomeParameter>
    public let interaction: MainboardInteraction<HomeCommand>
    public let flow: FlowHandler<HomeOutput>

    public static let defaultIdentifier: BoardID = .pubHome
}

extension MotherboardType where Self: FlowManageable {
    public func ioHome(_ identifier: BoardID = HomeMainDestination.defaultIdentifier) -> HomeMainDestination {
        HomeMainDestination(
            activation: activation(identifier, with: HomeParameter.self),
            interaction: interaction(identifier, with: HomeCommand.self),
            flow: matchedFlow(identifier, with: HomeOutput.self)
        )
    }
}
