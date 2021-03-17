//
//  GitHubSearchBuilder.swift
//  HelloBoardy
//
//  Created by FOLY on 3/17/21.
//  
//

import UIKit
import SiFUtilities

struct GitHubSearchBuilder: GitHubSearchBuildable {
    func build(withDelegate delegate: GitHubSearchDelegate?) -> GitHubSearchController {
        let controller = GitHubSearchViewController.instantiateFromStoryboard()
        controller.delegate = delegate
        return controller
    }
}
