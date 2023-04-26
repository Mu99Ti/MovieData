//
//  AppDelegate.swift
//  MovieData
//
//  Created by Muhamad Talebi on 4/24/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let navigationController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navigationController
        return true
    }
}

