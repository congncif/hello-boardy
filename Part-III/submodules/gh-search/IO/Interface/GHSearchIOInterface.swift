//
//  GHSearchIOInterface.swift
//  GHSearch
//
//  Created by Boardy on 6/1/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let pubGHSearch: BoardID = "pub.mod.GHSearch"   
}

// MARK: - Interface

public struct GHSearchDestination {
    public let activation: BoardActivation<GHSearchParameter>
    public let interaction: BoardInteraction<GHSearchCommand>

    public static let defaultIdentifier: BoardID = .pubGHSearch
}

extension ActivatableBoard {
    public func ioGHSearch(_ identifier: BoardID = GHSearchDestination.defaultIdentifier) -> GHSearchDestination {
        GHSearchDestination(
            activation: activation(identifier, with: GHSearchParameter.self),
            interaction: interaction(identifier, with: GHSearchCommand.self)
        )
    }
}

public struct GHSearchMainDestination {
    public let activation: MainboardActivation<GHSearchParameter>
    public let interaction: MainboardInteraction<GHSearchCommand>
    public let flow: FlowHandler<GHSearchOutput>

    public static let defaultIdentifier: BoardID = .pubGHSearch
}

extension MotherboardType where Self: FlowManageable {
    public func ioGHSearch(_ identifier: BoardID = GHSearchMainDestination.defaultIdentifier) -> GHSearchMainDestination {
        GHSearchMainDestination(
            activation: activation(identifier, with: GHSearchParameter.self),
            interaction: interaction(identifier, with: GHSearchCommand.self),
            flow: matchedFlow(identifier, with: GHSearchOutput.self)
        )
    }
}
