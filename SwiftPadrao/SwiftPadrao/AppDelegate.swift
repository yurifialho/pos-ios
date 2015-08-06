//
//  AppDelegate.swift
//  SwiftPadrao
//
//  Created by ios on 30/05/15.
//  Copyright (c) 2015 ios. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
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
/*
//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Person : NSObject {
var nome:String?
var idade:Int?


init(WithName nome:String, andIdade idade:Int){
self.nome = nome
self.idade = idade
}


func editarNome(nome:String, idade:Int) -> Void {
self.nome = nome
self.idade = idade

}
}

var pessoa:Person = Person(WithName: "Yuri", andIdade: 28)//Person("Yuri", 28);
//pessoa.nome = "Yuri"
//pessoa.idade = 28

println(pessoa.nome!)

var nome = pessoa.nome

pessoa.editarNome("NovoNome", idade: 30)

println(pessoa.nome!)


var listaNome:[String] = [String]()
listaNome.append("000")
listaNome.append("001")
listaNome.append("003")

for l in listaNome {
println(l)
}

for var x = 0 ; x < listaNome.count; x++ {
println(listaNome[x])
}*/

}

