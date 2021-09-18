//
//  GetCurrentUserTaskBoard.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Boardy
import Foundation
import HelloAuthIO
import SiFUtilities

enum GetCurrentUserTaskBoardFactory {
    static func make(identifier: BoardID) -> ActivatableBoard {
        BlockTaskBoard<GetCurrentUserInput, GetCurrentUserOutput>(identifier: identifier) { _, _, completion in
            let userDefaults = UserDefaults.standard

            if let username = userDefaults.string(forKey: StoreKeys.username),
                let token = userDefaults.string(forKey: StoreKeys.accessToken) {
                completion(.success(AuthUser(name: username, accessToken: token)))
            } else {
                completion(.success(nil))
            }
        }
    }
}
