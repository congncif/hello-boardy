//
//  RegisterProtocols.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import UIKit

protocol RegisterController: UIViewController {}

protocol RegisterDelegate: AnyObject {
    func registeredSuccessfully(user: String)
    func openLogin()
}

protocol RegisterBuildable {
    func build(withDelegate delegate: RegisterDelegate?) -> RegisterController
}
