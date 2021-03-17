//
//  BoardProducer.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//

import Boardy
import Foundation
import TinyInjector

struct BoardProducer: ActivableBoardProducer, Injecting {
    func produceBoard(identifier: BoardID) -> ActivatableBoard? {
        switch identifier {
        case .login:
            return LoginBoard(builder: LoginBuilder())
        case .register:
            return RegisterBoard(builder: RegisterBuilder())
        case .home:
            return HomeBoard(builder: HomeBuilder(), motherboard: Motherboard(boardProducer: self))
        case .authentication:
            return AuthenticationBoard(motherboard: Motherboard(boardProducer: self))
        case .authRequired:
            return AuthRequiredBoard(service: injector.inject(), motherboard: Motherboard(boardProducer: self))
        case .web:
            return WebBoard(builder: WebBuilder())
        case .gitHubSearch:
            return GitHubSearchBoard(builder: GitHubSearchBuilder())
        default:
            break
        }
        return NoBoard(identifier: identifier)
    }
}
