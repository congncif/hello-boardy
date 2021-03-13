//
//  BoardProducer.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//

import Boardy
import Foundation

struct BoardProducer: ActivableBoardProducer {
    func produceBoard(identifier: BoardID) -> ActivatableBoard? {
        switch identifier {
        case .login:
            return LoginBoard(builder: LoginBuilder())
        case .register:
            return RegisterBoard(builder: RegisterBuilder())
        case .home:
            return HomeBoard(builder: HomeBuilder())
        default:
            break
        }
        return NoBoard(identifier: identifier)
    }
}
