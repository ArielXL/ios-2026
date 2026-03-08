//
//  SceneDelegate.swift
//  App03
//
//  Created by Alumno on 3/3/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let root = ContactsViewController()
        let nav = UINavigationController(rootViewController: root)

        window.rootViewController = nav
        window.makeKeyAndVisible()
        self.window = window
    }
}
