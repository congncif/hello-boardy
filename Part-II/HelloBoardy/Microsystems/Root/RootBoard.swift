//
//  RootBoard.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//
//

import Boardy
import Foundation
import UIKit

final class RootBoard: ContinuousBoard, GuaranteedBoard {
    typealias InputType = Any

    init(motherboard: FlowMotherboard) {
        super.init(motherboard: motherboard)
    }

    func activate(withGuaranteedInput input: InputType) {
        continueBoard(.home)
    }
}
