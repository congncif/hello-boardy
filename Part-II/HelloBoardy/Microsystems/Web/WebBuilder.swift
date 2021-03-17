//
//  WebBuilder.swift
//  HelloBoardy
//
//  Created by FOLY on 3/17/21.
//  
//

import UIKit
import SiFUtilities

struct WebBuilder: WebBuildable {
    func build(withDelegate delegate: WebDelegate?) -> WebController {
        let controller = WebViewController.instantiateFromStoryboard()
        controller.delegate = delegate
        return controller
    }
}
