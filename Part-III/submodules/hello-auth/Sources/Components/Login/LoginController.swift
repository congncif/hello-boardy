//
//  LoginController.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Foundation

protocol LoginViewable: AnyObject {}

final class LoginController {
    weak var delegate: LoginControlDelegate?
    weak var view: LoginViewable!
}

extension LoginController: LoginInteractable {
    func didBecomeActive() {
        delegate?.didBecomeActive()
    }
}

extension LoginController: LoginControllable {}

// MARK: - View Model