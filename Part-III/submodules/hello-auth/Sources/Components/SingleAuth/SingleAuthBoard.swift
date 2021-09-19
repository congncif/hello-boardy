//
//  SingleAuthBoard.swift
//  HelloAuth
//
//  Created by NGUYEN CHI CONG on 9/19/21.
//
//

import Boardy
import Foundation
import UIKit

final class SingleAuthBoard: ModernContinuableBoard, GuaranteedBoard, GuaranteedOutputSendingBoard {
    typealias InputType = SingleAuthParameter
    typealias OutputType = SingleAuthOutput

    init(identifier: BoardID, producer: ActivableBoardProducer) {
        super.init(identifier: identifier, boardProducer: producer)
        registerFlows()
    }

    func activate(withGuaranteedInput input: @escaping InputType) {
        let completionHandler = input

        /// Use BlockTaskParameter to check if user logged in, otherwise require logging in before opening GHSearch
        let inlineParameter = GetCurrentUserParameter().onSuccess(target: self) { this, user in
            if let user = user {
                this.sendOutput(user)
                completionHandler(user)
            } else {
                /// Use AuthUser barrier to wait logging in before opening GHSearch, once barrier overcome the GHSearch will be activated
                this.motherboard.ioAuthUser().activation.activate(with: .wait { [unowned this] user in
                    this.sendOutput(user)
                    completionHandler(user)
                })

                /// Login required
                this.motherboard.ioAuthenticate().activation.activate()
            }
        }
        /// Check current user with inline parameter
        motherboard.ioCurrentUser().activation.activate(with: inlineParameter)
    }
}

private extension SingleAuthBoard {
    func registerFlows() {
        /// Listen Authenticate flow to mark AuthUser barrier as overcome or cancel
        motherboard.ioAuthenticate().flow.addTarget(motherboard) { mainboard, result in
            switch result {
            case let .authenticated(user):
                mainboard.ioAuthUser().activation.activate(with: .overcome(user))
            case .userClosed:
                mainboard.ioAuthUser().activation.activate(with: .cancel)
            }
        }
    }
}
