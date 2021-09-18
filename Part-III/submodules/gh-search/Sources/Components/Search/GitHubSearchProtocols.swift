//
//  GitHubSearchProtocols.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import UIKit

/// Use for pushing messages inwards from outside
protocol GitHubSearchControllable: AnyObject {
    func update(users: [GitHubUser])
}

/// Use for ViewController sending messages to outside directly
protocol GitHubSearchActionDelegate: AnyObject {}

/// Use for Controller (Interactor) sending messages to outside
protocol GitHubSearchControlDelegate: AnyObject {
    func didBecomeActive()
    func userDidSelect(_ user: GitHubUser)
}

/// Interface combined of above two delegates for convenience using purpose
protocol GitHubSearchDelegate: GitHubSearchActionDelegate, GitHubSearchControlDelegate {}

/// Defined interface for outside using purpose
struct GitHubSearchInterface {
    let userInterface: UIViewController
    let controller: GitHubSearchControllable
}

/// Construct and connect dependencies
protocol GitHubSearchBuildable {
    func build(withDelegate delegate: GitHubSearchDelegate?) -> GitHubSearchInterface
}
