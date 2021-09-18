//
//  GitHubSearchBuilder.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import UIKit
import SiFUtilities

struct GitHubSearchBuilder: GitHubSearchBuildable {
    func build(withDelegate delegate: GitHubSearchDelegate?) -> GitHubSearchInterface {
        let viewController = GitHubSearchViewController.instantiateFromStoryboard()
        viewController.delegate = delegate

        let controller = GitHubSearchController()
        controller.delegate = delegate
        controller.view = viewController
        
        viewController.interactor = controller

        return GitHubSearchInterface(userInterface: viewController, controller: controller)
    }
}
