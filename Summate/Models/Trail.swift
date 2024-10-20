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
  
  enum Terrain: String {
    case plain = "Plain"
    case forest = "Forest"
    case rocky = "Rocky"
    case mountain = "Mountain"
    case river = "River"
    case desert = "Desert"
    case snow = "Snow"
    case swamp = "Swamp"
  }
  
  static let sample: [Trail] = [
    Trail(name: "Sörmlandsleden", distance: 73.0, days: 3, difficulty: .easy, description: "Sörmlandsleden is one of Sweden's most famous and well-maintained hiking trails, stretching over 1,000 kilometers through the scenic region of Södermanland (Sörmland), just south of Stockholm. It offers a diverse landscape that includes dense forests, serene lakes, coastal areas, and charming rural villages, providing a great experience for nature lovers and outdoor enthusiasts.", terrain: [.plain, .river, .swamp], elevation: 500),
    Trail(name: "Trail 2", distance: 20.5, days: 4, difficulty: .moderate, description: "A challenging but beautiful trail", terrain: [.forest, .mountain], elevation: 1000),
    Trail(name: "Trail 3", distance: 5.0, days: 1, difficulty: .hard, description: "A short but tough trail", terrain: [.rocky, .snow], elevation: 500)
  ]
}
