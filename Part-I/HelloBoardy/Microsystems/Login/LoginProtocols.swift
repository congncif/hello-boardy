//
//  LoginProtocols.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import UIKit

protocol LoginController: UIViewController {}

protocol LoginDelegate: AnyObject {
    func loggedInSuccessfully(user: String)
    func openRegister()
}

protocol LoginBuildable {
    func build(withDelegate delegate: LoginDelegate?) -> LoginController
}
