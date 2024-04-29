//
//  PlayerStatsView.swift
//  SportsTracker
//
//  Created by John Waslen on 2/29/24.
//

import SwiftUI

struct PlayerStatsView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    var body: some View {
        VStack {
            GameCardHeader()
                .environmentObject(viewModel)
            if let players = viewModel.players {
                List {
                    ForEach(Array(arrayLiteral: "CE","LW","RW","D"), id: \.self) { position in
                        let header = positionName(for: position)
                    
                        Section(header: Text("\(header)")) {
                            
                            ForEach(players.players.filter { $0.pos == position }) { player in
                             
                                    switch(viewModel.selectedLeague) {
                                    case .NHL:
                                        PlayerCardBody(player: player, team: viewModel.selectedNHLTeam)
                                    case .AHL:
                                        PlayerCardBody(player: player, team: viewModel.selectedAHLTeam)
                                    case .KHL:
                                        PlayerCardBody(player: player, team: viewModel.selectedKHLTeam)
                                    }
                            
                               
                            }
                        }
                    }
                }.listStyle(.plain)
             
            }
           
        }
 
       
    }
}

extension PlayerStatsView {
    func positionName(for abbreviation: String) -> String {
        switch abbreviation {
        case "CE":
            return "Centre"
        case "LW":
            return "Left Wing"
        case "RW":
            return "Right Wing"
        case "D":
            return "Defense"
        default:
            return abbreviation // Return the original abbreviation if not matched
        }
    }
}

#Preview {
    PlayerStatsView()
        .environmentObject(ViewModel())
}
