//
//  RegisterViewController.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import UIKit

/// Use for interacting with data before sending messages to outside
protocol RegisterInteractable {
    func didBecomeActive()
}

final class RegisterViewController: UIViewController {
    // MARK: Dependencies

    weak var delegate: RegisterActionDelegate?

    var interactor: RegisterInteractable!

    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor.didBecomeActive()
    }

    // MARK: Private computed & temporary properties

    // MARK: IBOutlets / IBActions

    @IBOutlet private var usernameField: UITextField!
    @IBOutlet private var passwordField: UITextField!
    @IBOutlet private var password2Field: UITextField!

    @IBAction private func registerButtonDidTap() {
        view.endEditing(true)

        let username = usernameField.text!
        let password = passwordField.text!
        let password2 = password2Field.text!

        guard password == password2 else {
            notify(message: "Password is not matched")
            return
        }
        
        delegate?.performRegister(username: username, password: password)
    }

    @IBAction private func loginButtonDidTap() {
        backToPrevious()
    }

    @IBAction private func backgroundViewDidTap() {
        view.endEditing(true)
    }
}

// MARK: - Behaviors

extension RegisterViewController: RegisterViewable {}

// MARK: - Private methods

private extension RegisterViewController {
    func setupView() {}
}
