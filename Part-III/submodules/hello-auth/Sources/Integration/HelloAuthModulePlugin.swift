//
//  HelloAuthModulePlugin.swift
//  HelloAuth
//
//  Created by BOARDY on 6/1/21.
//
//

import Boardy
import Foundation
import HelloAuthIO

public struct HelloAuthModulePlugin: ModulePlugin {
    public let service: HelloAuthModulePlugin.ServiceType

    public init(service: HelloAuthModulePlugin.ServiceType) {
        self.service = service
    }

    public func apply(for main: MainComponent) {
        let mainProducer = main.producer

        switch service {
        case .authenticate:
            mainProducer.registerBoard(identifier) { identifier in
                LoginBoard(identifier: identifier, builder: LoginBuilder(), producer: BoardProducer(externalProducer: mainProducer, registrationsBuilder: { producer in
                    BoardRegistration(.modRegister) { identifier in
                        RegisterBoard(identifier: identifier, builder: RegisterBuilder(), producer: producer)
                    }

                    BoardRegistration(.modSignIn) { identifier in
                        SignInTaskBoardFactory.make(identifier: identifier)
                    }

                    BoardRegistration(.modSignUp) { identifier in
                        SignUpTaskBoardFactory.make(identifier: identifier)
                    }
                }))
            }
        case .currentUser:
            mainProducer.registerBoard(identifier) { identifier in
                GetCurrentUserTaskBoardFactory.make(identifier: identifier)
            }
        case .logout:
            mainProducer.registerBoard(identifier) { identifier in
                SignOutTaskBoardFactory.make(identifier: identifier)
            }
        case .signOnUser:
            mainProducer.registerBoard(identifier) { identifier in
                SingleAuthBoard(identifier: identifier, producer: BoardProducer(externalProducer: mainProducer, registrationsBuilder: { _ in
                    BoardRegistration(.modAuthUser) { identifier in
                        AuthUserBarrierBoard(identifier: identifier)
                    }
                    BoardRegistration(.modGetCurrentUser) { identifier in
                        GetCurrentUserTaskBoardFactory.make(identifier: identifier)
                    }
                }))
            }
        }
    }

    public var identifier: BoardID {
        switch service {
        case let .authenticate(identifier):
            return identifier
        case let .currentUser(identifier):
            return identifier
        case let .logout(identifier):
            return identifier
        case let .signOnUser(identifier):
            return identifier
        }
    }

    /// Each service is equivalent to one entry point
    public enum ServiceType {
        case authenticate(BoardID)
        case currentUser(BoardID)
        case logout(BoardID)
        case signOnUser(BoardID)
    }
}

extension HelloAuthModulePlugin {
    public static var bundledPlugins: [ModulePlugin] {
        return [
            HelloAuthModulePlugin(service: .authenticate(HelloAuthID.authenticate)),
            HelloAuthModulePlugin(service: .currentUser(HelloAuthID.currentUser)),
            HelloAuthModulePlugin(service: .logout(HelloAuthID.logout)),
            HelloAuthModulePlugin(service: .signOnUser(HelloAuthID.signOnUser)),
        ]
    }
}
