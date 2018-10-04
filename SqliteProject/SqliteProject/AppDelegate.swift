//
//  AppDelegate.swift
//  SqliteProject
//
//  Created by liang on 3/10/18.
//  Copyright © 2018 liang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var movieArray:[Movie] = []
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    copyDB()
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }

  func getDBPath()->String{
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)
    let documentDir = path[0]
    let database = (documentDir as NSString).appendingPathComponent("DBRepository.db")
    return database
  }
  
  func copyDB(){
    let fileManager = FileManager.default
    let dbPath = getDBPath()
    var success = fileManager.fileExists(atPath: dbPath)
    if(!success){
      if let dbDefaultPath = Bundle.main.path(forResource: "DBRepository", ofType: "db"){
        var error:NSError?
        do{
          try fileManager.copyItem(atPath: dbDefaultPath, toPath: dbPath)
          success = true
        }catch let error1 as NSError{
          error = error1
          success = false
        }
        print(dbDefaultPath)
        if(!success){
          print("Failed to create writable database with message" + error!.localizedDescription)
        }
        
      }else{
        print("Can't find files in bundle")
      }
      
    }else{
      print("File is already exist")
    }
    
  }
}

