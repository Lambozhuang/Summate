//
//  HikeListView.swift
//  Summate
//
//  Created by LamboZhuang on 2024-10-21.
//

import SwiftUI

struct HikeListView: View {
  @EnvironmentObject var viewModel: ViewModel
  var body: some View {
    NavigationStack {
      List {
        Button {
          viewModel.isCreatingHike = true
        } label: {
          HStack {
            Spacer()
            Image(systemName: "plus")
            Text("Start a new hike")
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
        .listRowSeparator(.hidden)
        
        ForEach(viewModel.hikes) { hike in
          ZStack {
            HikeListCardView(hike: hike)
            NavigationLink(destination: EmptyView()) {
              EmptyView()
            }
          }
          .listRowSeparator(.hidden)
          .listRowBackground(Color.clear)
        }
        
        Button {
          
        } label: {
          HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
            Text("View past hikes")
              .fontWeight(.semibold)
            Spacer()
          }
          .padding(10)
          .background(
            RoundedRectangle(cornerRadius: 20)
              .inset(by: 1)
              .stroke(Color(red: 0.33, green: 0.53, blue: 0.04), lineWidth: 2)
          )
          .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .buttonStyle(.plain)
        .listRowSeparator(.hidden)
        
      }
      .listStyle(.plain)
      .navigationTitle("My Hikes")
    }
  }
}

#Preview {
  HikeListView()
    .environmentObject(ViewModel())
}
