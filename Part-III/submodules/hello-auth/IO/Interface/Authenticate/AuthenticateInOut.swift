//
//  AuthenticateInOut.swift
//  HelloAuthIO
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Foundation

public typealias AuthenticateInput = Any?

public enum AuthenticateOutput {
    case authenticated(AuthUser)
    case userClosed
}

public enum AuthenticateCommand {}

public typealias AuthenticateParameter = AuthenticateInput
