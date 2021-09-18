//
//  AuthUser.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//

import Foundation

public struct AuthUser {
    public init(name: String, accessToken: String) {
        self.name = name
        self.accessToken = accessToken
    }

    public let name: String
    public let accessToken: String
}
