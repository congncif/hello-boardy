//
//  HomeProtocols.swift
//  Home
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import UIKit
import HelloAuthIO

/// Use for pushing messages inwards from outside
protocol HomeControllable: AnyObject {
    func updateUser(_ currentUser: AuthUser?)
}

/// Use for ViewController sending messages to outside directly
protocol HomeActionDelegate: AnyObject {
    func openLogin()
    func openGitHubSearch()
    func performLogout()
}

/// Use for Controller (Interactor) sending messages to outside
protocol HomeControlDelegate: AnyObject {
    func didBecomeActive()
}

/// Interface combined of above two delegates for convenience using purpose
protocol HomeDelegate: HomeActionDelegate, HomeControlDelegate {}

/// Defined interface for outside using purpose
struct HomeInterface {
    let userInterface: UIViewController
    let controller: HomeControllable
}

/// Construct and connect dependencies
protocol HomeBuildable {
    func build(withDelegate delegate: HomeDelegate?) -> HomeInterface
}
