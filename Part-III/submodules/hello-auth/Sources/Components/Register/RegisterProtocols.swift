//
//  RegisterProtocols.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import UIKit

/// Use for pushing messages inwards from outside
protocol RegisterControllable: AnyObject {}

/// Use for ViewController sending messages to outside directly
protocol RegisterActionDelegate: AnyObject {
    func performRegister(username: String, password: String)
}

/// Use for Controller (Interactor) sending messages to outside
protocol RegisterControlDelegate: AnyObject {
    func didBecomeActive()
}

/// Interface combined of above two delegates for convenience using purpose
protocol RegisterDelegate: RegisterActionDelegate, RegisterControlDelegate {}

/// Defined interface for outside using purpose
struct RegisterInterface {
    let userInterface: UIViewController
    let controller: RegisterControllable
}

/// Construct and connect dependencies
protocol RegisterBuildable {
    func build(withDelegate delegate: RegisterDelegate?) -> RegisterInterface
}
