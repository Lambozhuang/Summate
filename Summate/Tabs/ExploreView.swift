//
//  ExploreView.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-20.
//

import SwiftUI

struct ExploreView: View {
  @State private var searchText = ""
  @State private var sortOption: SortOption = .none
  
  @State private var trails = Trail.sample
  
  enum SortOption: String, CaseIterable, Identifiable {
    case none = "None"
    case distance = "Distance"
    case days = "Days"
    case difficulty = "Difficulty"
    
    var id: String { self.rawValue }
  }
  
  var filteredTrails: [Trail] {
    let sortedTrails = sortTrails(trails)
    if searchText.isEmpty {
      return sortedTrails
    } else {
      return sortedTrails.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
  }
  
  var body: some View {
    NavigationStack {
      List {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 10) {
            Image(systemName: "line.3.horizontal.decrease.circle")
              .font(.title)
              .foregroundStyle(.gray)
            
            FilterButton(title: "Distance", isSelected: sortOption == .distance) {
              toggleSortOption(.distance)
            }
            
            FilterButton(title: "Days", isSelected: sortOption == .days) {
              toggleSortOption(.days)
            }
            
            FilterButton(title: "Difficulty", isSelected: sortOption == .difficulty) {
              toggleSortOption(.difficulty)
            }
          }
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
        
        ForEach(filteredTrails.indices, id: \.self) { index in
          ZStack {
            ExploreTrailCardView(trail: filteredTrails[index])
            NavigationLink(destination: TrailDetailView(trail: filteredTrails[index])) {
              EmptyView()
            }
          }
          .listRowSeparator(.hidden)
          .listRowBackground(Color.clear)
          .padding(.bottom, index == filteredTrails.count - 1 ? 100 : 0) // Add padding to the last item
        }
      }
      .listStyle(.plain)
      .searchable(text: $searchText, prompt: "Search trails by name")
      .navigationTitle("Explore Trails")
    }
    .searchable(text: $searchText)
  }
  
  func toggleSortOption(_ option: SortOption) {
    if sortOption == option {
      sortOption = .none
    } else {
      sortOption = option
    }
  }
  
  func sortTrails(_ trails: [Trail]) -> [Trail] {
    switch sortOption {
    case .none:
      return trails
    case .distance:
      return trails.sorted { $0.distance < $1.distance }
    case .days:
      return trails.sorted { $0.days < $1.days }
    case .difficulty:
      return trails.sorted { $0.difficulty < $1.difficulty }
    }
  }
}

struct FilterButton: View {
  let title: String
  let isSelected: Bool
  let action: () -> Void
  
  var body: some View {
    Button(action: action) {
      Text(title)
        .font(.system(size: 15)
          .weight(.semibold))
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(isSelected ? Color(red: 0.81, green: 0.99, blue: 0.54) : Color(UIColor.systemGray6))
        .foregroundColor(.black)
        .cornerRadius(27)
    }
  }
}

#Preview {
  ExploreView()
}
