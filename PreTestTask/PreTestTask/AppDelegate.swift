//
//  AppDelegate.swift
//  PreTestTask
//
//  Created by Riya Kaniyawala on 30/05/21.
//

import UIKit
import SVProgressHUD
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK:- Variable || Dependencies
    var window  : UIWindow?

    class var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRootViewController()
        SVProgressHUD.setDefaultAnimationType(.native)
        return true
    }

}

extension AppDelegate {
    //MARK:- Private Method
    private func setupRootViewController() {
        let controller = PostFactory.shared.createModule()
        let navigationViewController = UINavigationController(rootViewController: controller)
        navigationViewController.viewControllers = [controller]
        navigationViewController.navigationBar.prefersLargeTitles = true
        self.window?.rootViewController = navigationViewController
        self.window?.makeKeyAndVisible()
    }
    
}

