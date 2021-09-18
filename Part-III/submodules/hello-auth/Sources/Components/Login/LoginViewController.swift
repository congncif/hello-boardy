//
//  LoginViewController.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import UIKit

/// Use for interacting with data before sending messages to outside
protocol LoginInteractable {
    func didBecomeActive()
}

final class LoginViewController: UIViewController {
    // MARK: Dependencies

    weak var delegate: LoginActionDelegate?

    var interactor: LoginInteractable!

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

    @IBAction private func loginButtonDidTap() {
        view.endEditing(true)
        let username = usernameField.text!
        let password = passwordField.text!

        delegate?.performLogin(username: username, password: password)
    }

    @IBAction private func registerButtonDidTap() {
        delegate?.openRegister()
    }

    @IBAction private func backgroundViewDidTap() {
        view.endEditing(true)
    }
}

// MARK: - Behaviors

extension LoginViewController: LoginViewable {}

// MARK: - Private methods

private extension LoginViewController {
    func setupView() {
        let closeButton: UIBarButtonItem
        if #available(iOS 13.0, *) {
            closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonDidTap(_:)))
        } else {
            closeButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(closeButtonDidTap(_:)))
        }
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc
    func closeButtonDidTap(_: Any) {
        backToPrevious(animated: true) { [weak delegate] in
            delegate?.loginDidClose()
        }
    }
}
