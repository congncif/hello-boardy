//
//  AppDelegate+Plugins.swift
//  HelloBoardy
//
//  Created by NGUYEN CHI CONG on 9/18/21.
//

import Boardy
import Foundation
import GHSearch
import HelloAuth
import Home
import HomeIO

extension AppDelegate {
    func loadPlugins() {
        PluginLauncher.with(options: .default)
            .install(plugins: HelloAuthModulePlugin.bundledPlugins)
            .install(plugins: GHSearchModulePlugin.bundledPlugins)
            .install(plugins: HomeModulePlugin.bundledPlugins)
            .initialize()
    }

    func launch() {
        PluginLauncher.shared.launch(on: window!) { mainboard in
            mainboard.ioHome().activation.activate()
        }
    }
}
