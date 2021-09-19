//
//  SignOnUserInOut.swift
//  HelloAuthIO
//
//  Created by NGUYEN CHI CONG on 9/19/21.
//
//

import Boardy
import Foundation

public typealias SignOnUserInput = (AuthUser) -> Void

public typealias SignOnUserOutput = AuthUser

public enum SignOnUserCommand {}

public typealias SignOnUserParameter = SignOnUserInput
