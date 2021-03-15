//
//  HomeBuilder.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import SiFUtilities
import UIKit

struct HomeBuilder: HomeBuildable {
    func build(withDelegate delegate: HomeDelegate?) -> HomeController {
        let controller = HomeViewController.instantiateFromStoryboard()
        controller.delegate = delegate
        return controller
    }
}
