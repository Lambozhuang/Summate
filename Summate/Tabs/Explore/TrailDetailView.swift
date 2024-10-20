//
//  TrailDetailView.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-21.
//

import SwiftUI

struct TrailDetailView: View {
  let trail: Trail
  var body: some View {
    ScrollView {
      Image("Sörmlandsleden")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(height: 270)
        .clipped()
        
      VStack(alignment: .leading, spacing: 10) {
        Text("Sörmlandsleden")
          .font(.largeTitle)
          .bold()
          .foregroundStyle(.white)
        HStack() {
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
            Text(trail.difficulty.string)
              .font(.title2)
              .bold()
            Text("Difficulty")
              .font(.footnote)
          }
          .frame(maxWidth: .infinity)
        }
        .padding()
        .background(
          Color.white
            .clipShape(.capsule)
            .shadow(radius: 10)
        )
        
        Text(trail.description)
          .foregroundStyle(Color(red: 0.4, green: 0.4, blue: 0.4))
        
        Text("Terrain")
          .font(.headline)
        FlexibleView(
          data: trail.terrain,
          spacing: 15,
          alignment: .leading
        ) { terrain in
          Text(terrain.rawValue)
            .font(.system(size: 15).weight(.semibold))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color(UIColor.systemGray6))
            .foregroundColor(.black)
            .cornerRadius(15)
            .lineLimit(1)
        }
        
        Text("Elevation")
          .font(.headline)
        Text(String(format: "%.0f meters", Double(trail.elevation)))
          .font(.system(size: 15).weight(.semibold))
          .padding(.horizontal, 12)
          .padding(.vertical, 8)
          .background(Color(UIColor.systemGray6))
          .foregroundColor(.black)
          .cornerRadius(15)
          .lineLimit(1)
      }
      .padding()
      .offset(y: -115)
    }
    .ignoresSafeArea()
  }
}

#Preview {
  TrailDetailView(trail: Trail.sample[0])
}