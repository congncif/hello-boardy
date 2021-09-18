//
//  SignUpTaskBoard.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Boardy
import Foundation
import SiFUtilities

enum SignUpTaskBoardFactory {
    static func make(identifier: BoardID) -> ActivatableBoard {
        TaskBoard<SignUpInput, SignUpOutput>(identifier: identifier) { _, input, completion in
            guard !input.username.isEmpty, !input.password.isEmpty else {
                completion(.failure(NSError.general(message: "Username and password must be not empty")))
                return
            }

            let userDefaults = UserDefaults.standard

            userDefaults.setValue(input.username, forKey: StoreKeys.username)
            userDefaults.setValue(input.password, forKey: StoreKeys.password)

            let newToken = UUID().uuidString
            userDefaults.setValue(newToken, forKey: StoreKeys.accessToken)
            
            completion(.success(SignUpOutput(name: input.username, accessToken: newToken)))
        }
        processingHandler: { $0.showDefaultLoading($0.isProcessing) }
    }
}
