//
//  ExampleAppApp.swift
//  ExampleApp
//
//  Created by Antonio on 19/10/21.
//

import SwiftUI

@main
struct ExampleAppApp: App {
	
	init() {
		UIScrollView.appearance().backgroundColor = .init(named: "background")
        let minus : UIImage = .init(systemName: "minus")!.withTintColor(.white, renderingMode: .alwaysOriginal)
        let plus : UIImage = .init(systemName: "plus")!.withTintColor(.white, renderingMode: .alwaysOriginal)
        UIStepper.appearance().setDecrementImage(minus, for: .normal)
        UIStepper.appearance().setIncrementImage(plus, for: .normal)
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().backgroundColor = .init(named:"background")
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
	}
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
