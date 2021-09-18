//
//  AppDelegate.swift
//  HelloBoardy
//
//  Created by NGUYEN CHI CONG on 3/8/21.
//

import Boardy
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UIViewController.swizzling()

        // 1. Load all plugins
        loadPlugins()

        // 2. Launch the first module as root
        launch()

        return true
    }
}
