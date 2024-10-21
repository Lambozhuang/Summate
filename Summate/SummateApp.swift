//
//  SummateApp.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-14.
//

import SwiftUI
import SwiftData

@main
struct SummateApp: App {
  
  @StateObject private var viewModel = ViewModel()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(viewModel)
        .tint(Color(red: 0.61, green: 0.9, blue: 0.24))
    }
  }
}
