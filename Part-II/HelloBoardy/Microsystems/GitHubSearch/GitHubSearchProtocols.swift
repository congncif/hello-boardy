//
//  GitHubSearchProtocols.swift
//  HelloBoardy
//
//  Created by FOLY on 3/17/21.
//  
//

import UIKit

protocol GitHubSearchController: UIViewController {}

protocol GitHubSearchDelegate: AnyObject {
    func openWebBrowser(withTitle title: String, link: String)
}

protocol GitHubSearchBuildable {
    func build(withDelegate delegate: GitHubSearchDelegate?) -> GitHubSearchController
}
