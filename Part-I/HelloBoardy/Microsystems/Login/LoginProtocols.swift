//
//  LoginProtocols.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import UIKit

protocol LoginController: UIViewController {
    var delegate: LoginDelegate? { get set }
}

protocol LoginDelegate: AnyObject {
    func loggedInSuccessfully(user: String)
    func openRegister()
}

protocol LoginBuildable {
    func build() -> LoginController
}
