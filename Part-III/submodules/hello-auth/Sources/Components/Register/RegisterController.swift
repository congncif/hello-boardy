//
//  RegisterController.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Foundation

protocol RegisterViewable: AnyObject {}

final class RegisterController {
    weak var delegate: RegisterControlDelegate?
    weak var view: RegisterViewable!
}

extension RegisterController: RegisterInteractable {
    func didBecomeActive() {
        delegate?.didBecomeActive()
    }
}

extension RegisterController: RegisterControllable {}

// MARK: - View Model