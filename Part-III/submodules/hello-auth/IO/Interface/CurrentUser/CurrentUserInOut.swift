//
//  CurrentUserInOut.swift
//  HelloAuthIO
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Boardy
import Foundation

public typealias CurrentUserInput = Any?

public typealias CurrentUserOutput = AuthUser?

public enum CurrentUserCommand {}

public typealias CurrentUserParameter = BlockTaskParameter<CurrentUserInput, CurrentUserOutput>
