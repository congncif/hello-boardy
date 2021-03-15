//
//  RegisterBuilder.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import SiFUtilities
import UIKit

struct RegisterBuilder: RegisterBuildable {
    func build(withDelegate delegate: RegisterDelegate?) -> RegisterController {
        let controller = RegisterViewController.instantiateFromStoryboard()
        controller.delegate = delegate
        return controller
    }
}
