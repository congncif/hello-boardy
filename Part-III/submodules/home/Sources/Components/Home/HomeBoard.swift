//
//  HomeBoard.swift
//  Home
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//
//

import Boardy
import Foundation
import GHSearchIO
import HelloAuthIO
import UIKit

final class HomeBoard: ModernContinuableBoard, GuaranteedBoard, GuaranteedOutputSendingBoard {
    typealias InputType = HomeInput
    typealias OutputType = HomeOutput

    private let builder: HomeBuildable

    init(identifier: BoardID, builder: HomeBuildable, producer: ActivableBoardProducer) {
        self.builder = builder
        super.init(identifier: identifier, boardProducer: producer)
        registerFlows()
    }

    func activate(withGuaranteedInput input: InputType) {
        let component = builder.build(withDelegate: self)
        let viewController = component.userInterface
        motherboard.putIntoContext(viewController)

        let nav = UINavigationController(rootViewController: viewController)
        window.setRootViewController(nav)

        /// Bind user to UI
        currentUserBus.connect(target: component.controller) { controller, user in
            controller.updateUser(user)
        }

        /// Bind return action
        returnBus.connect(target: viewController) { viewController in
            viewController.returnHere()
        }
    }

    private lazy var currentUserBus = Bus<AuthUser?>()
    private lazy var returnBus = Bus<Void>()
}

extension HomeBoard: HomeDelegate {
    func openLogin() {
        motherboard.ioAuthenticate().activation.activate()
    }

    func openGitHubSearch() {
        motherboard.ioSignOnUser().activation.activate { [unowned self] user in
            self.motherboard.ioGHSearch().activation.activate()
            self.currentUserBus.transport(input: user)
        }
    }

    func performLogout() {
        motherboard.ioLogout().activation.activate()
    }

    func didBecomeActive() {
        /// Check current user if needed to get logged user info
        motherboard.ioCurrentUser().activation.activate(with: CurrentUserParameter())
    }
}

private extension HomeBoard {
    func registerFlows() {
        /// Bind current user to UI
        motherboard.ioCurrentUser().flow.bind(to: currentUserBus)

        /// Bind current user to UI
        motherboard.ioAuthenticate().flow.addTarget(currentUserBus) { bus, result in
            switch result {
            case let .authenticated(user):
                bus.transport(input: user)
            case .userClosed:
                break
            }
        }

        /// Refresh current user
        motherboard.ioLogout().flow.addTarget(motherboard) { mainboard, _ in
            mainboard.ioCurrentUser().activation.activate(with: CurrentUserParameter())
        }

        /// Listen return home action
        motherboard.registerGeneralFlow { [weak self] (action: GHSearchAction) in
            switch action {
            case .webReturn:
                self?.returnBus.transport()
            }
        }
    }
}
