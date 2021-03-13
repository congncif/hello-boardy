//
//  RegisterProtocols.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//  
//

import UIKit

protocol RegisterController: UIViewController {
    var delegate: RegisterDelegate? { get set }
}

protocol RegisterDelegate: AnyObject {
    func registeredSuccessfully(user: String)
    func openLogin()
}

protocol RegisterBuildable {
    func build() -> RegisterController
}
