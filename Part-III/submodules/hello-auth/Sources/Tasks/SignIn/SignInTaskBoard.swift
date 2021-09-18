//
//  SignInTaskBoard.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Boardy
import Foundation
import HelloAuthIO
import SiFUtilities

enum SignInTaskBoardFactory {
    static func make(identifier: BoardID) -> ActivatableBoard {
        TaskBoard<SignInInput, SignInOutput>(identifier: identifier) { _, input, completion in
            guard !input.username.isEmpty, !input.password.isEmpty else {
                completion(.failure(NSError.general(message: "Username and password must be not empty")))
                return
            }

            let userDefaults = UserDefaults.standard

            guard let username = userDefaults.string(forKey: StoreKeys.username),
                let password = userDefaults.string(forKey: StoreKeys.password),
                !username.isEmpty,
                !password.isEmpty else {
                completion(.failure(NSError.general(message: "User not found")))
                return
            }

            if username == input.username, password == input.password {
                let newToken = UUID().uuidString
                userDefaults.setValue(newToken, forKey: StoreKeys.accessToken)
                completion(.success(SignInOutput(name: username, accessToken: newToken)))
            } else {
                completion(.failure(NSError.general(message: "Username or password isn't correct")))
            }
        }
        processingHandler: { $0.showDefaultLoading($0.isProcessing) }
    }
}
