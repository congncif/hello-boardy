//
//  RegisterBuilder.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import UIKit
import SiFUtilities

struct RegisterBuilder: RegisterBuildable {
    func build(withDelegate delegate: RegisterDelegate?) -> RegisterInterface {
        let viewController = RegisterViewController.instantiateFromStoryboard()
        viewController.delegate = delegate

        let controller = RegisterController()
        controller.delegate = delegate
        controller.view = viewController
        
        viewController.interactor = controller

        return RegisterInterface(userInterface: viewController, controller: controller)
    }
}
