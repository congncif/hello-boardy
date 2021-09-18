//
//  WebBoard.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Boardy
import Foundation
import GHSearchIO
import UIKit

final class WebBoard: ModernContinuableBoard, GuaranteedBoard, GuaranteedOutputSendingBoard {
    typealias InputType = WebInput
    typealias OutputType = WebOutput

    private let builder: WebBuildable

    init(identifier: BoardID, builder: WebBuildable, producer: ActivableBoardProducer) {
        self.builder = builder
        super.init(identifier: identifier, boardProducer: producer)
        registerFlows()
    }

    func activate(withGuaranteedInput input: InputType) {
        let component = builder.build(withDelegate: self)
        let viewController = component.userInterface
        motherboard.putIntoContext(viewController)
        rootViewController.show(viewController)

        component.controller.load(request: input)
    }
}

extension WebBoard: WebDelegate {
    func didBecomeActive() {}

    func returnHome() {
        broadcastAction(.webReturn)
    }
}

private extension WebBoard {
    func registerFlows() {}
}
