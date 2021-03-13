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

    private lazy var rootBoard: RootBoard = {
        let mainboard = Motherboard(boardProducer: BoardProducer())
        return RootBoard(motherboard: mainboard)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        rootBoard.installIntoWindow(window!)
        rootBoard.activate()

        return true
    }
}
