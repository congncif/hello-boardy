//
//  WebBuilder.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import UIKit
import SiFUtilities

struct WebBuilder: WebBuildable {
    func build(withDelegate delegate: WebDelegate?) -> WebInterface {
        let viewController = WebViewController.instantiateFromStoryboard()
        viewController.delegate = delegate

        let controller = WebController()
        controller.delegate = delegate
        controller.view = viewController
        
        viewController.interactor = controller

        return WebInterface(userInterface: viewController, controller: controller)
    }
}
