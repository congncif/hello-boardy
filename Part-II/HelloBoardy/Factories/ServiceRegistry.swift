//
//  Registry.swift
//  HelloBoardy
//
//  Created by FOLY on 3/17/21.
//

import Foundation
import TinyInjector

struct ServiceRegistry: Injecting {
    func registerAllServices() {
        let sharedAuthService = AuthenticationService()
        injector.register { sharedAuthService }.implements(Authenticating.self)

        injector.register { GithubSearchService() }.implements(GitHubSearching.self)
    }
}
