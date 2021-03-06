//
//  AppDelegate.swift
//  WyrdDemo
//
//  Created by Max Desyatov on 30/06/2014.
//  Copyright (c) 2014 Max Desyatov. All rights reserved.
//

import UIKit
import Wyrd

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
    let s = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    let u1 = NSURL(string: "https://librivox.org/api/feed/audiobooks/?id=52&format=json")
    let u2 = NSURL(string: "https://librivox.org/api/feed/audiobooks/?id=53&format=json")

    // explicit typing here not really needed for closures, but compiler is buggy
    s.getURLData(u1) => { (full: FullResponse) -> Wyrd<FullResponse> in
      switch full {
      case let (data, response):
        println("data length is \(data.length)")
      }
      return s.getURLData(u2)
    } =~ { full in
      switch full {
      case let (data, response):
        println("data length is \(data.length)")
      }
    }

    return true
  }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

