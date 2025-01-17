//
//  ViewModel.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-21.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
  @Published var isCreatingHike = false
  @Published var isFinishingCreatingHike = false
  
  @Published var hikes: [Hike] = [Hike.sample]
  
  init() {}
}
