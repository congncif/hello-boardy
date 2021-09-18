//
//  GitHubSearchIOInterface.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let modGitHubSearch: BoardID = "mod.GHSearch.GitHubSearch"
}

// MARK: - Interface

struct GitHubSearchDestination {
    let activation: BoardActivation<GitHubSearchParameter>
    let interaction: BoardInteraction<GitHubSearchCommand>
}

extension ActivatableBoard {
    func ioGitHubSearch(_ identifier: BoardID = .modGitHubSearch) -> GitHubSearchDestination {
        GitHubSearchDestination(
            activation: activation(identifier, with: GitHubSearchParameter.self),
            interaction: interaction(identifier, with: GitHubSearchCommand.self)
        )
    }
}

struct GitHubSearchMainDestination {
    let activation: MainboardActivation<GitHubSearchParameter>
    let interaction: MainboardInteraction<GitHubSearchCommand>
    let flow: FlowHandler<GitHubSearchOutput>
}

extension MotherboardType where Self: FlowManageable {
    func ioGitHubSearch(_ identifier: BoardID = .modGitHubSearch) -> GitHubSearchMainDestination {
        GitHubSearchMainDestination(
            activation: activation(identifier, with: GitHubSearchParameter.self),
            interaction: interaction(identifier, with: GitHubSearchCommand.self),
            flow: matchedFlow(identifier, with: GitHubSearchOutput.self)
        )
    }
}
