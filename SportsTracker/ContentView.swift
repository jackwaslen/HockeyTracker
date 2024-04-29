//
//  ContentView.swift
//  SportsTracker
//
//  Created by John Waslen on 1/15/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
  
     
                TabView {
                    GameStatsView()
                        .environmentObject(viewModel)
                 
                        .tabItem { Label("Scores", systemImage: "house")
                                .foregroundColor(.white)
                          }
                    // .badge("!")
                    
                    PlayerStatsView()
                        .environmentObject(viewModel)
                        .tabItem { Label("Stats", systemImage: "newspaper")
                            .foregroundColor(.white)}
                        
                    
                    StandingsStatsView()
                        .environmentObject(viewModel)
                        .tabItem {
                            Label("Standings", systemImage: "trophy")
                       
                        }
                }
        
    }
}

#Preview {
    ContentView()
}
