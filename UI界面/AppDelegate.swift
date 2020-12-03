//
//  AppDelegate.swift
//  MySwiftinUI
//
//  Created by chenjintao on 2020/12/1.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow()
        window.frame = UIScreen.main.bounds
        window.backgroundColor = UIColor.white
        let vc1 = FirstViewController()
        let nav1 = RootNavViewController.init(rootViewController: vc1)
        nav1.tabBarItem = UITabBarItem.init(title: "视图一", image: UIImage.init(named: "home_tab_nomal"), tag: 0)

        let vc2 = SecondViewController()
        let nav2 = RootNavViewController.init(rootViewController: vc2)
        nav2.tabBarItem = UITabBarItem.init(title: "视图二", image: UIImage.init(named: "partion_tab_nomal"), tag: 0)

        let tabbarVC = TabbarController()

        let arr = [nav1,nav2]
        tabbarVC.viewControllers = arr
        
        window.rootViewController = tabbarVC
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }

//    func addTabbarVC(controller:UIViewController,title:String) {
//        controller.tabBarItem = UITabBarItem.init(title: title, image: nil, tag: nil)
//
//    }

}

