//
//  SignOutTaskBoard.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Boardy
import Foundation
import SiFUtilities

enum SignOutTaskBoardFactory {
    static func make(identifier: BoardID) -> ActivatableBoard {
        TaskBoard<SignOutInput, SignOutOutput>(identifier: identifier) { _, _, completion in
            let userDefaults = UserDefaults.standard
            userDefaults.removeObject(forKey: StoreKeys.accessToken)
            completion(.success(()))
        }
        processingHandler: { $0.showDefaultLoading($0.isProcessing) }
    }
}
