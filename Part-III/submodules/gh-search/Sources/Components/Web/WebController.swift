//
//  WebController.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//  
//

import Foundation

protocol WebViewable: AnyObject {
    func load(request: WebRequest)
}

final class WebController {
    weak var delegate: WebControlDelegate?
    weak var view: WebViewable!
}

extension WebController: WebInteractable {
    func didBecomeActive() {
        delegate?.didBecomeActive()
    }
}

extension WebController: WebControllable {
    func load(request: WebRequest) {
        view.load(request: request)
    }
}

// MARK: - View Model
