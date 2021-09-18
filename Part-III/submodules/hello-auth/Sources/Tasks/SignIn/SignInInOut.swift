//
//  SignInInOut.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Boardy
import Foundation
import HelloAuthIO

typealias SignInInput = SignInCredentials

typealias SignInOutput = AuthUser

typealias SignInCommand = Any?

typealias SignInParameter = SignInInput

struct SignInCredentials {
    let username: String
    let password: String
}
