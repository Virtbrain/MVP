//
//  SceneDelegate.swift
//  MVP
//
//  Created by Alexey Manankov on 26.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    enum MVPFeatureAssembly {
        static func buildFeature() -> UINavigationController {
            let view = GreetingView()
            let presenter = Presenter()
            let model = Person(firstName: "David", lastName: "Blaine")
            
            view.presenter = presenter
            presenter.view = view
            presenter.model = model
            
            return UINavigationController.init(rootViewController: view)
        }
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = MVPFeatureAssembly.buildFeature()
        window.makeKeyAndVisible()
        self.window = window
    }
}

