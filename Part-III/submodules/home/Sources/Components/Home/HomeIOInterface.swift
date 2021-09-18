//
//  HomeIOInterface.swift
//  Home
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let modHome: BoardID = "mod.Home.Home"
}

// MARK: - Interface

struct HomeDestination {
    let activation: BoardActivation<HomeParameter>
    let interaction: BoardInteraction<HomeCommand>
}

extension ActivatableBoard {
    func ioHome(_ identifier: BoardID = .modHome) -> HomeDestination {
        HomeDestination(
            activation: activation(identifier, with: HomeParameter.self),
            interaction: interaction(identifier, with: HomeCommand.self)
        )
    }
}

struct HomeMainDestination {
    let activation: MainboardActivation<HomeParameter>
    let interaction: MainboardInteraction<HomeCommand>
    let flow: FlowHandler<HomeOutput>
}

extension MotherboardType where Self: FlowManageable {
    func ioHome(_ identifier: BoardID = .modHome) -> HomeMainDestination {
        HomeMainDestination(
            activation: activation(identifier, with: HomeParameter.self),
            interaction: interaction(identifier, with: HomeCommand.self),
            flow: matchedFlow(identifier, with: HomeOutput.self)
        )
    }
}
