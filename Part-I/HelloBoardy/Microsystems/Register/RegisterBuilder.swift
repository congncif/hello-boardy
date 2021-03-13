//
//  RegisterBuilder.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//  
//

import UIKit
import SiFUtilities

struct RegisterBuilder: RegisterBuildable {
    func build() -> RegisterController {
        RegisterViewController.instantiateFromStoryboard()
    }
}
