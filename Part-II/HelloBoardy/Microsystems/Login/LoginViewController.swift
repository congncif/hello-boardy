//
//  LoginViewController.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import TinyInjector
import UIKit
import ViewStateCore

final class LoginViewController: UIViewController, LoginController {
    // MARK: Dependencies

    weak var delegate: LoginDelegate?

    lazy var state = LoginViewState()

    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        state.register(subscriberObject: self)
    }

    // MARK: Privates

    @LazyInjected var authService: Authenticating

    @IBOutlet private var usernameField: UITextField!
    @IBOutlet private var passwordField: UITextField!

    @IBAction private func loginButtonDidTap() {
        view.endEditing(true)
        let username = usernameField.text!

        guard !username.isEmpty else {
            notify(message: "username empty")
            return
        }

        // Perform login with username & password
        authService.authenticate(credentials: username) { [weak delegate] _ in
            delegate?.loggedInSuccessfully(user: username)
        }
    }

    @IBAction private func registerButtonDidTap() {
        delegate?.openRegister()
    }

    @IBAction private func backgroundViewDidTap() {
        view.endEditing(true)
    }
}

// MARK: - Behaviors

extension LoginViewController {}

// MARK: - ViewState

extension LoginViewController: DedicatedViewStateRenderable {
    func dedicatedRender(state: LoginViewState) {
        // handle state changes
    }
}
