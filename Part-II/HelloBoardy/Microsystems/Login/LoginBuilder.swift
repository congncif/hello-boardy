//
//  LoginBuilder.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import SiFUtilities
import UIKit

struct LoginBuilder: LoginBuildable {
    func build(withDelegate delegate: LoginDelegate?) -> LoginController {
        let controller = LoginViewController.instantiateFromStoryboard()
        controller.delegate = delegate
        return controller
    }
}
