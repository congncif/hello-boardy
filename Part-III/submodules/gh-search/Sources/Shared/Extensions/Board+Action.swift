//
//  Board+Action.swift
//  GHSearch
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//

import Boardy
import Foundation
import GHSearchIO

extension IdentifiableBoard {
    func broadcastAction(_ action: GHSearchAction) {
        sendFlowAction(action)
    }
}
