//
//  EmptyHikeView.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-21.
//

import SwiftUI

struct EmptyHikeView: View {
  @EnvironmentObject var viewModel: ViewModel
  
  var body: some View {
    VStack {
      Image("backpack")
        .resizable()
        .scaledToFit()
        .frame(height: 250)
        .clipShape(.rect(cornerRadius: 30))
        .padding()
      
      Text("You have no upcoming hikes")
        .font(.title3)
        .fontWeight(.semibold)
        .lineLimit(1)
      
      Button {
        viewModel.isCreatingHike = true
      } label: {
        HStack {
          Spacer()
          Image(systemName: "plus")
          Text("Create a Hike")
            .fontWeight(.semibold)
          Spacer()
        }
        .foregroundStyle(.black)
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 20)
            .inset(by: 1)
            .fill(Color(red: 0.81, green: 0.99, blue: 0.54))
            .stroke(Color(red: 0.61, green: 0.86, blue: 0.26).opacity(0.24), lineWidth: 2)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
      }
      .buttonStyle(.plain)
      .fullScreenCover(isPresented: $viewModel.isCreatingHike) {
        SelectTrailView()
      }
      
      Spacer()
    }
    .padding(.horizontal)
    .navigationTitle("Your Hikes")
  }
}

#Preview {
  NavigationStack {
    EmptyHikeView()
      .environmentObject(ViewModel())
  }
}
