//
//  RegisterViewController.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import TinyInjector
import UIKit
import ViewStateCore

final class RegisterViewController: UIViewController, RegisterController {
    // MARK: Dependencies

    weak var delegate: RegisterDelegate?

    lazy var state = RegisterViewState()

    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        state.register(subscriberObject: self)
    }

    // MARK: Privates

    @LazyInjected var authService: Authenticating

    @IBOutlet private var usernameField: UITextField!
    @IBOutlet private var passwordField: UITextField!
    @IBOutlet private var password2Field: UITextField!

    @IBAction private func registerButtonDidTap() {
        view.endEditing(true)
        let username = usernameField.text!

        guard !username.isEmpty else {
            notify(message: "username empty")
            return
        }

        // Perform register with username & password
        authService.authenticate(credentials: username) { [weak delegate] _ in
            delegate?.registeredSuccessfully(user: username)
        }
    }

    @IBAction private func loginButtonDidTap() {
        delegate?.openLogin()
    }

    @IBAction private func backgroundViewDidTap() {
        view.endEditing(true)
    }
}

// MARK: - Behaviors

extension RegisterViewController {}

// MARK: - ViewState

extension RegisterViewController: DedicatedViewStateRenderable {
    func dedicatedRender(state: RegisterViewState) {
        // handle state changes
    }
}
