//
//  FinishingCreatingHikeView.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-21.
//

import SwiftUI

struct FinishingCreatingHikeView: View {
  @EnvironmentObject var viewModel: ViewModel
  let hike: Hike
  var body: some View {
    ScrollView {
      VStack(spacing: 10) {
        ZStack(alignment: .bottomLeading) {
          GeometryReader { geometry in
            Image(hike.trail!.name)
              .resizable()
              .scaledToFill()
              .frame(width: geometry.size.width, height: 200) // Subtract 32 for default padding (16 * 2)
              .clipped()
              .cornerRadius(12) // Rounded corners for the image
              .overlay( // Adding the border as an overlay
                RoundedRectangle(cornerRadius: 12)
                  .stroke(Color(UIColor.systemBackground), lineWidth: 4)
                  .shadow(radius: 5)
              )
          }
          VStack(alignment: .leading, spacing: 0) {
            Text(hike.trail!.name)
              .font(.largeTitle)
              .bold()
              .foregroundStyle(.white)
              .shadow(radius: 5)
            HStack {
              Text(formattedDateRange(startDate: hike.startDate, endDate: hike.endDate))
              Text("·")
              if hike.numberOfHikers == 1 {
                Text("\(hike.numberOfHikers) person")
              } else {
                Text("\(hike.numberOfHikers) people")
              }
            }
            .font(.headline)
            .foregroundStyle(.white)
            .opacity(0.8)
          }
          .padding()
        }
        .frame(height: 200)
        .padding(.bottom)
        
        Text("Your hike is ready!")
          .font(.largeTitle)
          .fontWeight(.semibold)
        
        Text("Invite your friends and start your preparation")
          .foregroundStyle(.secondary)
          .padding(.bottom)
        
        VStack(spacing: 20) {
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 15) {
              PersonProfileView(name: "Laieh", joined: true)
              PersonProfileView(name: "Laieh")
              PersonProfileView(name: "Laieh")
              PersonProfileView(name: "Laieh")
            }
          }
          Button {
            
          } label: {
            HStack {
              Spacer()
              
              Text("Share Invite")
                .fontWeight(.semibold)
              Image(systemName: "square.and.arrow.up")
              Spacer()
            }
            .foregroundStyle(Color.primary)
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 20)
                .inset(by: 1)
                .fill(Color(UIColor.systemBackground))
                .stroke(Color(red: 0.31, green: 0.51, blue: 0.02).opacity(0.19), lineWidth: 2)
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
          }
          .buttonStyle(.plain)
        }
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 15)
            .inset(by: 0.5)
            .fill(Color(UIColor.secondarySystemBackground))
            .stroke(Color(UIColor.systemGray5), lineWidth: 2)
        )
        .padding(.bottom)
        
        Button {
          viewModel.hikes.append(hike)
          viewModel.isCreatingHike = false
          viewModel.isFinishingCreatingHike = false
          
        } label: {
          HStack {
            Spacer()
            
            Text("Go to Hike")
              .fontWeight(.semibold)
            Image(systemName: "arrow.right")
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
        
        Spacer()
      }
      .padding()
    }
  }
  
  func formattedDateRange(startDate: Date, endDate: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d"
    
    let monthFormatter = DateFormatter()
    monthFormatter.dateFormat = "MMMM"
    
    let startDay = dateFormatter.string(from: startDate)
    let endDay = dateFormatter.string(from: endDate)
    
    let month = monthFormatter.string(from: startDate)
    
    // Check if start and end date are in the same month
    if Calendar.current.isDate(startDate, inSameDayAs: endDate) {
      return "\(startDay) \(month)"
    } else {
      return "\(startDay)-\(endDay) \(month)"
    }
  }
}

struct PersonProfileView: View {
  var name: String = ""
  var joined: Bool = false
  var body: some View {
    VStack {
      Image(systemName: "person")
        .font(.largeTitle)
        .frame(width: 60, height: 60)
        .foregroundStyle(.gray)
        .background(
          RoundedRectangle(cornerRadius: 30)
            .inset(by: 1)
            .fill(Color(UIColor.systemGray2))
            .stroke(Color(UIColor.systemGray3), lineWidth: 2)
        )
      Text("\(name)")
      if joined {
        Text("Joined")
          .font(.footnote)
          .foregroundStyle(.secondary)
      }
    }
  }
}

#Preview {
  FinishingCreatingHikeView(hike: Hike.sample)
    .environmentObject(ViewModel())
}
