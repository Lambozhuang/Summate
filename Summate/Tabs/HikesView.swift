//
//  HikesView.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-20.
//

import SwiftUI

struct HikesView: View {
  @EnvironmentObject var viewModel: ViewModel
  var body: some View {
    NavigationStack {
      if viewModel.hikes.count == 0 {
        EmptyHikeView()
      } else {
        HikeListView()
      }
    }
    .fullScreenCover(isPresented: $viewModel.isCreatingHike) {
      SelectTrailView()
    }
  }
}

#Preview {
  HikesView()
    .environmentObject(ViewModel())
}
