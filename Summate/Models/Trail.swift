//
//  Trail.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-20.
//

import Foundation

final class Trail: Identifiable {
  var id = UUID()
  var name: String = "name"
  var distance: Double = 0.0
  var days: Int = 0
  var difficulty: Difficulty = .easy
  var description: String = "description"
  var terrain: [Terrain] = []
  var elevation: Double = 0.0
  var imageName: String?
  
  init() {
    
  }
  
  init(name: String, distance: Double, days: Int, difficulty: Difficulty, description: String, terrain: [Terrain], elevation: Double, imageName: String? = nil) {
    self.name = name
    self.distance = distance
    self.days = days
    self.difficulty = difficulty
    self.description = description
    self.terrain = terrain
    self.elevation = elevation
    self.imageName = imageName
  }
  
  enum Difficulty: String {
    case easy
    case moderate
    case hard
    
    var string: String {
      switch self {
      case .easy: "Easy"
      case .moderate: "Moderate"
      case .hard: "Hard"
      }
    }
  }
  
  enum Terrain {
    case plain
    case forest
    case rocky
    case mountain
    case river
    case desert
    case snow
  }
  
  static let sample: [Trail] = [
    Trail(name: "Trail 1", distance: 10.0, days: 2, difficulty: .easy, description: "A nice easy trail", terrain: [.plain], elevation: 200),
    Trail(name: "Trail 2", distance: 20.5, days: 4, difficulty: .moderate, description: "A challenging but beautiful trail", terrain: [.forest, .mountain], elevation: 1000),
    Trail(name: "Trail 3", distance: 5.0, days: 1, difficulty: .hard, description: "A short but tough trail", terrain: [.rocky, .snow], elevation: 500)
  ]
}
