//
//  GHSearchID.swift
//  GHSearch
//
//  Created by Boardy on 6/1/21.
//
//

import Boardy

public enum GHSearchID {
    public static let `default`: BoardID = .pubGHSearch
}

public enum GHSearchAction: BoardFlowAction {
    case webReturn
}
