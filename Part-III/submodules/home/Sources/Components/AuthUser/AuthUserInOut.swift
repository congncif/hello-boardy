//
//  AuthUserInOut.swift
//  Home
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Boardy
import Foundation
import HelloAuthIO

typealias AuthUserInput = Any?

typealias AuthUserOutput = AuthUserInput

typealias AuthUserCommand = Any?

typealias AuthUserBarrierBoard = BarrierBoard<AuthUserInput>

typealias AuthUserParameter = AuthUserBarrierBoard.Action
