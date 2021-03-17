//
//  HomeProtocols.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import UIKit

protocol HomeController: UIViewController {
    func reloadData()
}

protocol HomeDelegate: AnyObject {
    func openLogin()
    func openGitHubSearch()
}

protocol HomeBuildable {
    func build(withDelegate delegate: HomeDelegate?) -> HomeController
}
