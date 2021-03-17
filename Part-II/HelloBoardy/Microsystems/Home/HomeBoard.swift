//
//  HomeBoard.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import Boardy
import Foundation
import UIKit

final class HomeBoard: ContinuousBoard, GuaranteedBoard {
    typealias InputType = Any

    private let builder: HomeBuildable

    private lazy var reloadBus = Bus<Void>()
    private lazy var returnBus = Bus<Void>()

    init(identifier: BoardID = .home, builder: HomeBuildable, motherboard: FlowMotherboard) {
        self.builder = builder
        super.init(identifier: identifier, motherboard: motherboard)
        registerFlows()
    }

    func activate(withGuaranteedInput input: InputType) {
        let viewController = builder.build(withDelegate: self)
        let nav = UINavigationController(rootViewController: viewController)
        window.setRootViewController(nav)

        returnBus.connect(target: viewController) { target in
            target.returnHere()
        }

        reloadBus.connect(target: viewController) { target in
            target.reloadData()
        }
    }

    private func registerFlows() {
        motherboard.registerGuaranteedFlow(matchedIdentifiers: .authentication, .authRequired, target: self, uniqueOutputType: String.self) { target, _ in
            target.reloadBus.transport()
        }

        motherboard.registerGeneralFlow(target: self, uniqueOutputType: ReturnAction.self) { target, action in
            switch action {
            case .home:
                target.returnBus.transport()
            }
        }
    }
}

extension HomeBoard: HomeDelegate {
    func openLogin() {
        continueBoard(.authentication)
    }

    func openGitHubSearch() {
        continueBoard(.authRequired(target: .gitHubSearch))
    }
}
