//
//  GameStatsView.swift
//  SportsTracker
//
//  Created by John Waslen on 3/6/24.
//

import SwiftUI

struct GameStatsView: View {
    @EnvironmentObject var viewModel: ViewModel
   
    var index = 0
    var body: some View {
        
    
        if let games = viewModel.games?.playedGames {
            VStack {
                GameCardHeader()

                List(games){game in
                   
                    GameCardBody(game: game, homeWinner: game.homeTeamScore >= game.awayTeamScore, favouriteTeam: viewModel.getSelectedTeam())
                }.listStyle(.plain)
            }
         
        }
    }
}

#Preview {
    GameStatsView()
        .environmentObject(ViewModel())
}
