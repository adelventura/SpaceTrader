//
//  AppDelegate.swift
//  SpaceBroker
//
//  Created by Ashley DelVentura on 2/14/19.
//  Copyright © 2019 Ashley DelVentura. All rights reserved.
//

import UIKit
import Firebase 

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }

}

