//
//  SignInIOInterface.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let modSignIn: BoardID = "mod.HelloAuth.SignIn"
}

// MARK: - Interface

struct SignInDestination {
    let activation: BoardActivation<SignInParameter>
    let interaction: BoardInteraction<SignInCommand>
}

extension ActivatableBoard {
    func ioSignIn(_ identifier: BoardID = .modSignIn) -> SignInDestination {
        SignInDestination(
            activation: activation(identifier, with: SignInParameter.self),
            interaction: interaction(identifier, with: SignInCommand.self)
        )
    }
}

struct SignInMainDestination {
    let activation: MainboardActivation<SignInParameter>
    let interaction: MainboardInteraction<SignInCommand>
    let flow: FlowHandler<SignInOutput>
}

extension MotherboardType where Self: FlowManageable {
    func ioSignIn(_ identifier: BoardID = .modSignIn) -> SignInMainDestination {
        SignInMainDestination(
            activation: activation(identifier, with: SignInParameter.self),
            interaction: interaction(identifier, with: SignInCommand.self),
            flow: matchedFlow(identifier, with: SignInOutput.self)
        )
    }
}
