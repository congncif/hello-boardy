//
//  LoginBuilder.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//  
//

import UIKit
import SiFUtilities

struct LoginBuilder: LoginBuildable {
    func build() -> LoginController {
        LoginViewController.instantiateFromStoryboard()
    }
}
