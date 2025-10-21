//
//  AppDelegate.swift
//  saTechChallenge
//
//  Created by Alejandra Perez on 10/17/25.
//

import UIKit
import IterableSDK

class AppDelegate: UIResponder, UIApplicationDelegate, IterableURLDelegate, IterableCustomActionDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let config = IterableConfig()
        config.enableEmbeddedMessaging = true
        config.urlDelegate = self
        config.customActionDelegate = self
        config.allowedProtocols = ["http", "tel"]
        config.useInMemoryStorageForInApps = true
        IterableAPI.initialize(apiKey: "5145e75c49bc493299a5c31361825f77", launchOptions: launchOptions, config: config)
        
        // Set the email of user
                IterableAPI.email = "alejandra.perez@iterable.com"


        return true
    }
    
    func handle(iterableURL url: URL, inContext context: IterableActionContext) -> Bool {
        // Returning false allows the SDK (or system) to handle the URL
        return false
    }
  
    func handle(iterableCustomAction action: IterableAction, inContext context: IterableActionContext) -> Bool {
        // Returning false drops the action if not handled
        return false
    }
}
