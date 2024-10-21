//
//  AddHikeInfoView.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-21.
//

import SwiftUI

struct AddHikeInfoView: View {
  @EnvironmentObject var viewModel: ViewModel
  
  @State private var selectedDurationType: SelectedDurationType = .multiDay
  
  @State private var hike = Hike()
  
  let trail: Trail
  
  enum SelectedDurationType: String, CaseIterable, Identifiable {
    case multiDay = "Multi Day"
    case oneDay = "One Day"
    
    var durationText: String {
      switch self {
      case .multiDay: return "Requires less preparation and considerations like shelter, sleeping bags and night stops"
      case .oneDay: return "Requires less preparation and considerations like shelter, sleeping bags and night stops"
      }
    }
    
    var id: String { self.rawValue }
  }
  
  var body: some View {
    ScrollView {
      VStack(spacing: 10) {
        ZStack(alignment: .bottomLeading) {
          GeometryReader { geometry in
            Image(trail.name)
              .resizable()
              .scaledToFill()
              .frame(width: geometry.size.width, height: 200) // Subtract 32 for default padding (16 * 2)
              .clipped()
              .cornerRadius(12) // Rounded corners for the image
              .overlay( // Adding the border as an overlay
                RoundedRectangle(cornerRadius: 12)
                  .stroke(Color(UIColor.secondarySystemBackground), lineWidth: 4)
                  .shadow(radius: 5)
              )
          }
          Text(trail.name)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
            .shadow(radius: 5)
            .padding()
        }
        .frame(height: 200)
        .padding(.bottom)
        
        VStack {
          HStack {
            Image(systemName: "calendar")
            Text("Duration")
          }
          
          Picker("", selection: $selectedDurationType) {
            ForEach(SelectedDurationType.allCases) { selectedDurationType in
              Text(selectedDurationType.rawValue).tag(selectedDurationType)
            }
          }
          .pickerStyle(.segmented)
          .font(.largeTitle)
          .colorMultiply(Color(red: 0.81, green: 0.99, blue: 0.54))
          Text(selectedDurationType.durationText)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom)
          
          DatePicker("Select starting date", selection: $hike.startDate, displayedComponents: .date)
            .datePickerStyle(.compact)
          if selectedDurationType == .multiDay {
            DatePicker("Select ending date", selection: $hike.endDate, displayedComponents: .date)
              .datePickerStyle(.compact)
          }
        }
        .padding()
        .background(
          Color(UIColor.secondarySystemBackground)
            .clipShape(.rect(cornerRadius: 12))
            .shadow(radius: 5)
        )
        
        VStack {
          HStack {
            Image(systemName: "person.2")
            Text("Number of Hikers")
          }
          
          HStack {
            Spacer()
            Button(action: {
              if hike.numberOfHikers > 1 {
                withAnimation {
                  hike.numberOfHikers -= 1
                }
              }
            }) {
              Text("-")
                .font(.largeTitle)
                .frame(width: 44, height: 44)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(22)
            }
            .buttonStyle(.plain)
            
            Spacer()
            Text("\(hike.numberOfHikers)")
              .font(.largeTitle)
              .padding(.horizontal)
            Spacer()
            
            Button(action: {
              withAnimation {
                hike.numberOfHikers += 1
                print(hike.numberOfHikers)
              }
            }) {
              Text("+")
                .font(.largeTitle)
                .frame(width: 44, height: 44)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(22)
            }
            .buttonStyle(.plain)
            Spacer()
          }
        }
        .padding()
        .background(
          Color(UIColor.secondarySystemBackground)
            .clipShape(.rect(cornerRadius: 12))
            .shadow(radius: 5)
        )
        .padding(.bottom)
        
        Button {
          hike.endDate = hike.startDate
          viewModel.isFinishingCreatingHike = true
        } label: {
          HStack {
            Spacer()
            
            Text("Select This Trail")
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
      .navigationTitle("Add Hike Information")
      .onAppear {
        hike.trail = trail
      }
      .fullScreenCover(isPresented: $viewModel.isFinishingCreatingHike) {
        FinishingCreatingHikeView(hike: hike)
      }
    }
  }
}

#Preview {
  AddHikeInfoView(trail: Trail.sample[0])
    .environmentObject(ViewModel())
  
}
