//
//  AppDelegate.swift
//  AlamofireTest
//
//  Created by Denis Snezhko on 15.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.rootViewController = MainAssembly.assembly()
        window?.makeKeyAndVisible()
        return true
    }
}
