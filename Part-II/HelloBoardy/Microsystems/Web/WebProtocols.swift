//
//  WebProtocols.swift
//  HelloBoardy
//
//  Created by FOLY on 3/17/21.
//
//

import UIKit

protocol WebController: UIViewController {
    func load(webInput: WebInput)
}

protocol WebDelegate: AnyObject {
    func returnHome()
}

protocol WebBuildable {
    func build(withDelegate delegate: WebDelegate?) -> WebController
}
