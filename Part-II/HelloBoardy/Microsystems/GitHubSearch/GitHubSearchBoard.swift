//
//  GitHubSearchBoard.swift
//  HelloBoardy
//
//  Created by FOLY on 3/17/21.
//
//

import Boardy
import Foundation
import UIKit

final class GitHubSearchBoard: Board, GuaranteedBoard {
    typealias InputType = Any

    private let builder: GitHubSearchBuildable

    init(identifier: BoardID = .gitHubSearch, builder: GitHubSearchBuildable) {
        self.builder = builder
        super.init(identifier: identifier)
    }

    func activate(withGuaranteedInput input: InputType) {
        let viewController = builder.build(withDelegate: self)
        rootViewController.show(viewController)
    }
}

extension GitHubSearchBoard: GitHubSearchDelegate {
    func openWebBrowser(withTitle title: String, link: String) {
        nextToBoard(.web(WebInput(title: title, link: link)))
    }
}
