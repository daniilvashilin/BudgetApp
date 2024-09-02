//
//  BudgetAppApp.swift
//  BudgetApp
//
//  Created by Daniil Vaschilin on 24/08/2024.
//

import SwiftUI

@main
struct BudgetAppApp: App {
    @StateObject var globalModel = GlobalModel()
     var body: some Scene {
         WindowGroup {
             ContentView()
                 .environmentObject(globalModel)  // Make sure this is provided here
         }
     }
 }
