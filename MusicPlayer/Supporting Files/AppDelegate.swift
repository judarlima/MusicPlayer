//
//  AppDelegate.swift
//  MusicPlayer
//
//  Created by Judar Lima on 04/03/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        let coordinator = Coordinator(navigationController: navigationController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator.navigationController
        window?.makeKeyAndVisible()
        
        coordinator.start()
        
        return true
    }

}

