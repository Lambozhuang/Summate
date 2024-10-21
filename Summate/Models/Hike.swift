//
//  Hike.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-14.
//

import Foundation

struct Hike: Identifiable {
  let id = UUID()
  var trail: Trail? = nil
  var startDate: Date = Date()
  var endDate: Date = Date()
  var numberOfHikers: Int = 2
  
  init() {
    
  }
  
  init(trail: Trail, startDate: Date, endDate: Date, numberOfHikers: Int) {
    self.trail = trail
    self.startDate = startDate
    self.endDate = endDate
    self.numberOfHikers = numberOfHikers
  }
  
  static let sample = Hike(trail: Trail.sample[0], startDate: .now, endDate: .now, numberOfHikers: 1)
}
