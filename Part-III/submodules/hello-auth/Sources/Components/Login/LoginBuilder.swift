//
//  LoginBuilder.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import UIKit
import SiFUtilities

struct LoginBuilder: LoginBuildable {
    func build(withDelegate delegate: LoginDelegate?) -> LoginInterface {
        let viewController = LoginViewController.instantiateFromStoryboard()
        viewController.delegate = delegate

        let controller = LoginController()
        controller.delegate = delegate
        controller.view = viewController
        
        viewController.interactor = controller

        return LoginInterface(userInterface: viewController, controller: controller)
    }
}
