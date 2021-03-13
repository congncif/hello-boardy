//
//  HomeBuilder.swift
//  HelloBoardy
//
//  Created by FOLY on 3/13/21.
//  
//

import UIKit
import SiFUtilities

struct HomeBuilder: HomeBuildable {
    func build() -> HomeController {
        HomeViewController.instantiateFromStoryboard()
    }
}
