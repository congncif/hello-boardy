//
//  HomeProtocols.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import UIKit

protocol HomeController: UIViewController {
    func withUser(_ user: String)
}

protocol HomeDelegate: AnyObject {
    func openLogin()
}

protocol HomeBuildable {
    func build(withDelegate delegate: HomeDelegate?) -> HomeController
}
