//
//  AppDelegate.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 21/7/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        initDependencies()
        
        let carListStoryboard: UIStoryboard = UIStoryboard(name: Storyboards.CarListViewController, bundle: nil)
        let carListVC: CarListViewController = carListStoryboard.instantiateViewController(withIdentifier: Storyboards.CarListViewController) as! CarListViewController
        carListVC.injectDependencies(injectApp())
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = carListVC
        self.window?.makeKeyAndVisible()

        return true
    }

    private func initDependencies() {
        AppInjector.initialize(AppInjector.Injector(AppModule()))
    }


}

