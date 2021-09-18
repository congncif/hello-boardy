//
//  WebProtocols.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import UIKit

/// Use for pushing messages inwards from outside
protocol WebControllable: AnyObject {
    func load(request: WebRequest)
}

/// Use for ViewController sending messages to outside directly
protocol WebActionDelegate: AnyObject {
    func returnHome()
}

/// Use for Controller (Interactor) sending messages to outside
protocol WebControlDelegate: AnyObject {
    func didBecomeActive()
}

/// Interface combined of above two delegates for convenience using purpose
protocol WebDelegate: WebActionDelegate, WebControlDelegate {}

/// Defined interface for outside using purpose
struct WebInterface {
    let userInterface: UIViewController
    let controller: WebControllable
}

/// Construct and connect dependencies
protocol WebBuildable {
    func build(withDelegate delegate: WebDelegate?) -> WebInterface
}
