//
//  WebIOInterface.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let modWeb: BoardID = "mod.GHSearch.Web"
}

// MARK: - Interface

struct WebDestination {
    let activation: BoardActivation<WebParameter>
    let interaction: BoardInteraction<WebCommand>
}

extension ActivatableBoard {
    func ioWeb(_ identifier: BoardID = .modWeb) -> WebDestination {
        WebDestination(
            activation: activation(identifier, with: WebParameter.self),
            interaction: interaction(identifier, with: WebCommand.self)
        )
    }
}

struct WebMainDestination {
    let activation: MainboardActivation<WebParameter>
    let interaction: MainboardInteraction<WebCommand>
    let flow: FlowHandler<WebOutput>
}

extension MotherboardType where Self: FlowManageable {
    func ioWeb(_ identifier: BoardID = .modWeb) -> WebMainDestination {
        WebMainDestination(
            activation: activation(identifier, with: WebParameter.self),
            interaction: interaction(identifier, with: WebCommand.self),
            flow: matchedFlow(identifier, with: WebOutput.self)
        )
    }
}
