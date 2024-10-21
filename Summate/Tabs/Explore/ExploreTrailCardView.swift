//
//  ExploreTrailCardView.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-20.
//

import SwiftUI

struct ExploreTrailCardView: View {
  let trail: Trail
  
  var body: some View {
    VStack(spacing: 0) {
      ZStack(alignment: .bottomLeading) {
        Image("Sörmlandsleden")
          .resizable()
          .scaledToFill()
          .frame(height: 120)
          .clipped()
        Text(trail.name)
          .font(.largeTitle)
          .foregroundStyle(.white)
          .shadow(radius: 2)
          .bold()
          .padding()
      }
      
      HStack() {
        Spacer()
        VStack {
          Text(String(format: "%.2f km", Double(trail.distance)))
            .font(.title2)
            .bold()
          Text("Distance")
            .font(.footnote)
        }
        .frame(maxWidth: .infinity)
        Spacer()
        Divider()
        Spacer()
        VStack {
          Text("\(trail.days) days")
            .font(.title2)
            .bold()
          Text("Length")
            .font(.footnote)
        }
        .frame(maxWidth: .infinity)
        Spacer()
        Divider()
        Spacer()
        VStack {
          Text(trail.difficulty.rawValue)
            .font(.title2)
            .bold()
          Text("Difficulty")
            .font(.footnote)
        }
        .frame(maxWidth: .infinity)
        Spacer()
      }
    }
    .frame(height: 200)
    .cornerRadius(16)
    .background(
      Color(UIColor.systemGray6)
        .cornerRadius(16)
        .shadow(radius: 5)
    )
    
  }
}

#Preview {
  ExploreTrailCardView(trail: Trail())
}
