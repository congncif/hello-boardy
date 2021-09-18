//
//  HomeModulePlugin.swift
//  Home
//
//  Created by BOARDY on 6/1/21.
//
//

import Boardy
import Foundation
import HomeIO

public struct HomeModulePlugin: ModulePlugin {
    public let service: HomeModulePlugin.ServiceType

    public init(service: HomeModulePlugin.ServiceType) {
        self.service = service
    }

    public func apply(for main: MainComponent) {
        let mainProducer = main.producer

        switch service {
        case .default:
            mainProducer.registerBoard(identifier) { [unowned mainProducer] identifier in
                HomeBoard(identifier: identifier, builder: HomeBuilder(), producer: BoardProducer(externalProducer: mainProducer, registrationsBuilder: { _ in
                    BoardRegistration(.modAuthUser) { identifier in
                        AuthUserBarrierBoard(identifier: identifier)
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

extension HomeModulePlugin {
    public static var bundledPlugins: [ModulePlugin] {
        return [
            HomeModulePlugin(service: .default(HomeID.default)),
        ]
    }
}
