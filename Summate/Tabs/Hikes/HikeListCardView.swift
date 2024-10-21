//
//  HikeListCardView.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-21.
//

import SwiftUI

struct HikeListCardView: View {
  let hike: Hike
  var body: some View {
    VStack(spacing: 0) {
      ZStack(alignment: .bottomLeading) {
        Image("Sörmlandsleden")
          .resizable()
          .scaledToFill()
          .frame(height: 120)
          .clipped()
        Text(hike.trail!.name)
          .font(.largeTitle)
          .foregroundStyle(.white)
          .shadow(radius: 2)
          .bold()
          .padding()
      }
      
      HStack() {
        Spacer()
        VStack {
          Text(String(format: "%.2f km", Double(hike.trail!.distance)))
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
          Text("\(hike.trail!.days) days")
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
          Text(hike.trail!.difficulty.rawValue)
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
  HikeListCardView(hike: Hike.sample)
}
