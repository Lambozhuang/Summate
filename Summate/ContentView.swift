//
//  ContentView.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-14.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  
  var body: some View {
    TabView {
      HikesView()
        .tabItem {
          Label("Hikes", systemImage: "mountain.2.fill")
        }
      ExploreView()
        .tabItem {
          Label("Explore", systemImage: "map.fill")
        }
      MyGearView()
        .tabItem {
          Label("My Gear", systemImage: "house.fill")
        }
    }
  }
}

#Preview {
  ContentView()
    .tint(.green)
}
