//
//  HomeBuilder.swift
//  Home
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import UIKit
import SiFUtilities

struct HomeBuilder: HomeBuildable {
    func build(withDelegate delegate: HomeDelegate?) -> HomeInterface {
        let viewController = HomeViewController.instantiateFromStoryboard()
        viewController.delegate = delegate

        let controller = HomeController()
        controller.delegate = delegate
        controller.view = viewController
        
        viewController.interactor = controller

        return HomeInterface(userInterface: viewController, controller: controller)
    }
}
