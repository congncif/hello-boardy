//
//  AuthenticatationService.swift
//  HelloBoardy
//
//  Created by FOLY on 3/17/21.
//

import Foundation

protocol Authenticating {
    var currentUser: String? { get }

    func authenticate(credentials: String,
                      completion: (Result<String, Error>) -> Void)
    func quit()
}

extension Authenticating {
    var isAuthenticated: Bool { currentUser != nil }
}

final class AuthenticationService: Authenticating {
    private(set) var currentUser: String?

    func authenticate(credentials: String,
                      completion: (Result<String, Error>) -> Void) {
        currentUser = credentials
        completion(.success(credentials))
    }

    func quit() {
        currentUser = nil
    }
}
