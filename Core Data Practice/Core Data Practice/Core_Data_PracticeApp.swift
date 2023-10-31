//
//  Core_Data_PracticeApp.swift
//  Core Data Practice
//
//  Created by Navami Ajay on 31/10/23.
//

import SwiftUI

@main
struct Core_Data_PracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
