//
//  GitHubSearchBoard.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Boardy
import Foundation
import UIKit

final class GitHubSearchBoard: ModernContinuableBoard, GuaranteedBoard, GuaranteedOutputSendingBoard {
    typealias InputType = GitHubSearchInput
    typealias OutputType = GitHubSearchOutput

    private let builder: GitHubSearchBuildable

    init(identifier: BoardID, builder: GitHubSearchBuildable, producer: ActivableBoardProducer) {
        self.builder = builder
        super.init(identifier: identifier, boardProducer: producer)
        registerFlows()
    }

    func activate(withGuaranteedInput input: InputType) {
        let component = builder.build(withDelegate: self)
        let viewController = component.userInterface
        motherboard.putIntoContext(viewController)
        rootViewController.show(viewController)

        usersBus.connect(target: component.controller) { controller, users in
            controller.update(users: users)
        }
    }

    private lazy var usersBus = Bus<[GitHubUser]>()
}

extension GitHubSearchBoard: GitHubSearchDelegate {
    func userDidSelect(_ user: GitHubUser) {
        motherboard.ioWeb().activation.activate(with: WebParameter(title: user.username, link: user.homeUrl))
    }
    
    func didBecomeActive() {
        motherboard.ioSearch().activation.activate(with: SearchParameter(query: "Apple"))
    }
}

private extension GitHubSearchBoard {
    func registerFlows() {
        motherboard.ioSearch().flow.bind(to: usersBus)
    }
}
