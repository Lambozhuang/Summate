//
//  SelectTrailView.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-21.
//

import SwiftUI

struct SelectTrailView: View {
  @EnvironmentObject var viewModel: ViewModel
  
  var body: some View {
    NavigationStack {
      ZStack(alignment: .bottom) {
        ExploreView()
        NavigationLink(destination: SkipTrailView()) {
          HStack {
            Spacer()
            
            Text("Skip Trail Selection")
              .fontWeight(.semibold)
            Image(systemName: "chevron.right.2")
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
        .padding()
      }
      .navigationTitle("Select a Trail")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) { // Aligns to the leading side
          Button("Cancel") {
            viewModel.isCreatingHike = false
          }
        }
      }
    }
  }
}

#Preview {
  SelectTrailView()
    .environmentObject(ViewModel())
}
