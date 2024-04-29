//
//  GameCardHeader.swift
//  SportsTracker
//
//  Created by Jack Waslen on 2/28/24.
//

import SwiftUI

struct GameCardHeader: View {

    @EnvironmentObject var viewModel : ViewModel
    
    var body: some View {
        HStack {
            Picker("League", selection: $viewModel.selectedLeague) {
                Text("NHL").tag(League.NHL)
                Text("AHL").tag(League.AHL)
                Text("KHL").tag(League.KHL)
            }
            .pickerStyle(.menu)

            Spacer()
            
           
            switch(viewModel.selectedLeague){
            case .NHL:
                
                Picker("Team", selection: $viewModel.selectedNHLTeam) {
            
                        ForEach(NHLTeams.allCases, id: \.self) { team in
                            Text(team.rawValue).tag(team)
                        }

                    
                }
            case .AHL:
                Picker("Team", selection: $viewModel.selectedAHLTeam) {
      
                        ForEach(AHLTeams.allCases, id: \.self) { team in
                            Text(team.rawValue).tag(team)
                        }

                    
                }
            case .KHL:
            Picker("Team", selection: $viewModel.selectedKHLTeam) {
      
                    ForEach(KHLTeams.allCases, id: \.self) { team in
                        Text(team.rawValue).tag(team)
                    }
                }
                
  
               
            }
           
        }.padding(.horizontal)
            
        
    }
}

#Preview {
    GameCardHeader()
        .environmentObject(ViewModel())
}
