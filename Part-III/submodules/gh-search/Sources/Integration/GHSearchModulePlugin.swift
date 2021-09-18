//
//  GHSearchModulePlugin.swift
//  GHSearch
//
//  Created by BOARDY on 6/1/21.
//
//

import Boardy
import Foundation
import GHSearchIO

public struct GHSearchModulePlugin: ModulePlugin {
    public let service: GHSearchModulePlugin.ServiceType

    public init(service: GHSearchModulePlugin.ServiceType) {
        self.service = service
    }

    public func apply(for main: MainComponent) {
        let mainProducer = main.producer

        switch service {
        case .default:
            mainProducer.registerBoard(identifier) { [unowned mainProducer] identifier in
                GitHubSearchBoard(identifier: identifier, builder: GitHubSearchBuilder(), producer: BoardProducer(externalProducer: mainProducer, registrationsBuilder: { producer in
                    BoardRegistration(.modSearch) { identifier in
                        SearchTaskBoardFactory.make(identifier: identifier)
                    }
                    
                    BoardRegistration(.modWeb) { identifier in
                        WebBoard(identifier: identifier, builder: WebBuilder(), producer: producer)
                    }
                }))
            }
        }
    }

    public var identifier: BoardID {
        switch service {
        case let .default(identifier):
            return identifier
        }
    }

    /// Each service is equivalent to one entry point
    public enum ServiceType {
        case `default`(BoardID)
    }
}

extension GHSearchModulePlugin {
    public static var bundledPlugins: [ModulePlugin] {
        return [
            GHSearchModulePlugin(service: .default(GHSearchID.default)),
        ]
    }
}
