//
//  AppDelegate.swift
//  UnitTestsBasicMVP
//
//  Created by Victor Magalhaes on 14/09/2018.
//  Copyright © 2018 Victor Magalhaes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setRootViewController()
        return true
    }

    private func setRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let model = EditFieldsPresenter.ViewModel(
            firstFieldTitle: "Password",
            secondFieldTitle: "New Password",
            firstInputPlaceholder: "Type your current password",
            secondInputPlaceholder: "Type your new password",
            saveActionTitle: "Save"
        )
        let router = EditFieldsRouter()
        let viewController = router.buildModule(model: model)
        router.view = viewController
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }

}
