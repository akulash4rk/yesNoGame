//
//  SceneDelegate.swift
//  firstProject
//
//  Created by Владислав Баранов on 17.03.2024.
//

import UIKit


var mainView = ViewController()
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)

        let tabBarController = UITabBarController()
        

        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
        loadGameDataFromDefaults()
        func createMainView() -> UINavigationController {
            mainView = ViewController()
            
            
            //settings tabBar
            mainView.tabBarItem = UITabBarItem(title: "Данетки", image: UIImage(systemName: "checkmark.circle.badge.xmark"), tag: 1)
            mainView.tabBarItem.badgeColor = ThemeColors.shared.color(for: "text")
            
            
            //settings navigation
            let update = UINavigationController(rootViewController: mainView)
            update.viewControllers.first?.navigationItem.title = "Данетки"
            update.viewControllers.first?.navigationItem.titleView?.tintColor = ThemeColors.shared.color(for: "text")
            update.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(test))
            update.viewControllers.first?.navigationItem.rightBarButtonItem?.tintColor = ThemeColors.shared.color(for: "text")
            update.navigationBar.barTintColor = ThemeColors.shared.color(for: "background")
            UINavigationBar.appearance().tintColor = ThemeColors.shared.color(for: "background")
            UINavigationBar.appearance().backgroundColor = ThemeColors.shared.color(for: "background")
            update.navigationBar.backgroundColor = ThemeColors.shared.color(for: "background")
            update.navigationBar.tintColor = .brown
            
            return update
        }
        
        
        
        
        func createSettigsView() -> UINavigationController {
            let settingsView = UIViewController()
            settingsView.tabBarItem = UITabBarItem(title: "TaskOne", image: UIImage(systemName: "doc.richtext"), tag: 1)
            settingsView.tabBarItem.badgeColor = ThemeColors.shared.color(for: "text")
            return UINavigationController(rootViewController: settingsView)
        }
        
        
        
        func createTabBarController() -> UITabBarController {
            let mainNavController = createMainView()
            let settingsNavController = createSettigsView()
            tabBarController.viewControllers = [mainNavController, settingsNavController]
            tabBarController.tabBar.barTintColor = ThemeColors.shared.color(for: "background")
            UITabBar.appearance().tintColor = ThemeColors.shared.color(for: "background")
            UITabBar.appearance().backgroundColor = ThemeColors.shared.color(for: "background")
            tabBarController.tabBar.backgroundColor = ThemeColors.shared.color(for: "background")
            tabBarController.tabBar.tintColor = ThemeColors.shared.color(for: "text")
            return tabBarController
        }
        
    }
    @objc func test(){
        print("lol")
    }
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {

        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

