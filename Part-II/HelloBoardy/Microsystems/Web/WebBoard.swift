//
//  WebBoard.swift
//  HelloBoardy
//
//  Created by FOLY on 3/17/21.
//
//

import Boardy
import Foundation
import UIKit

final class WebBoard: Board, GuaranteedBoard {
    typealias InputType = WebInput

    private let builder: WebBuildable

    init(identifier: BoardID = .web, builder: WebBuildable) {
        self.builder = builder
        super.init(identifier: identifier)
    }

    func activate(withGuaranteedInput input: InputType) {
        let viewController = builder.build(withDelegate: self)
        rootViewController.show(viewController)

        viewController.load(webInput: input)
    }
}

extension WebBoard: WebDelegate {
    func returnHome() {
        broadcastAction(ReturnAction.home)
    }
}
