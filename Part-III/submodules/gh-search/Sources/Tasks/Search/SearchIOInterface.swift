//
//  SearchIOInterface.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let modSearch: BoardID = "mod.GHSearch.Search"
}

// MARK: - Interface

struct SearchDestination {
    let activation: BoardActivation<SearchParameter>
    let interaction: BoardInteraction<SearchCommand>
}

extension ActivatableBoard {
    func ioSearch(_ identifier: BoardID = .modSearch) -> SearchDestination {
        SearchDestination(
            activation: activation(identifier, with: SearchParameter.self),
            interaction: interaction(identifier, with: SearchCommand.self)
        )
    }
}

struct SearchMainDestination {
    let activation: MainboardActivation<SearchParameter>
    let interaction: MainboardInteraction<SearchCommand>
    let flow: FlowHandler<SearchOutput>
}

extension MotherboardType where Self: FlowManageable {
    func ioSearch(_ identifier: BoardID = .modSearch) -> SearchMainDestination {
        SearchMainDestination(
            activation: activation(identifier, with: SearchParameter.self),
            interaction: interaction(identifier, with: SearchCommand.self),
            flow: matchedFlow(identifier, with: SearchOutput.self)
        )
    }
}
