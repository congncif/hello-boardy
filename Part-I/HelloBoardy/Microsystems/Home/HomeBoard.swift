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

final class HomeBoard: Board, GuaranteedBoard {
    typealias InputType = String

    private let builder: HomeBuildable

    init(builder: HomeBuildable) {
        self.builder = builder
        super.init(identifier: .home)
    }

    func activate(withGuaranteedInput input: InputType) {
        let viewController = builder.build()
        viewController.delegate = self
        let nav = UINavigationController(rootViewController: viewController)
        window.setRootViewController(nav)

        viewController.withUser(input)
    }
}

extension HomeBoard: HomeDelegate {
    func openLogin() {
        nextToBoard(.login)
    }
}
