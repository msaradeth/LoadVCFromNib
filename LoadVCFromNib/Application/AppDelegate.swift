//
//  AppDelegate.swift
//  LoadVCFromNib
//
//  Created by Mike Saradeth on 4/26/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let items = [Product]()
        let productApi = ProductApiService()
        let viewModel = ListViewModel(items: items, productApiService: productApi)
        
        let vc = ListVC(title: "Products", viewModel: viewModel, nibName: "ListVC")
        let rootNav = UINavigationController(rootViewController: vc)
        rootNav.navigationBar.prefersLargeTitles = true

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = rootNav
                
        return true
    }
 

}

