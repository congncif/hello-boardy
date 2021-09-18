//
//  LoginProtocols.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import UIKit

/// Use for pushing messages inwards from outside
protocol LoginControllable: AnyObject {}

/// Use for ViewController sending messages to outside directly
protocol LoginActionDelegate: AnyObject {
    func openRegister()
    func performLogin(username: String, password: String)
    func loginDidClose()
}

/// Use for Controller (Interactor) sending messages to outside
protocol LoginControlDelegate: AnyObject {
    func didBecomeActive()
}

/// Interface combined of above two delegates for convenience using purpose
protocol LoginDelegate: LoginActionDelegate, LoginControlDelegate {}

/// Defined interface for outside using purpose
struct LoginInterface {
    let userInterface: UIViewController
    let controller: LoginControllable
}

/// Construct and connect dependencies
protocol LoginBuildable {
    func build(withDelegate delegate: LoginDelegate?) -> LoginInterface
}
