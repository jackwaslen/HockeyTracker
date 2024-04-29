//
//  ViewModel.swift
//  SportsTracker
//
//  Created by John Waslen on 2/29/24.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var standings: StandingsData? = nil
    @Published var players: PlayerStatsTeam? = nil
    @Published var games: GameStatsTeam? = nil
    @Published var selectedNHLTeam: NHLTeams = NHLTeams.TOR
    {
        didSet {
            getData()
        }
    }
    @Published var selectedAHLTeam: AHLTeams = AHLTeams.ABB
    {
        didSet {
            getData()
        }
    }
    @Published var selectedKHLTeam: KHLTeams = KHLTeams.ADM
    {
        didSet {
            getData()
        }
    }
    @Published var selectedLeague: League = .NHL {
    didSet {
        getStandings()
    }
}
    let httpManager = HTTPManager()
    
    init() {
        getData()
        getStandings()
       // getGameDetail(id: "498241")
    }
    
    func getSelectedTeam() -> any Team{
        switch(selectedLeague) {
        case .NHL:
            return selectedNHLTeam
        case .AHL:
            return selectedAHLTeam
        case .KHL:
            return selectedKHLTeam
        }
    }
    func getGameDetail(id : String) {
        httpManager.downloadGameDetail(id: id) { result in
            switch result {
            case .success(let data):

                     
                     
                     do {
                         let decoder = JSONDecoder()
                         let gameDetailResponse = try decoder.decode(GameDetail.self, from: data)
                         print(gameDetailResponse)
                         
                     } catch {
                         print("Error in Download Game Detail! \(error)")
                         
                     }
               
             case .failure(let error):
                 print("Error: \(error)")
             }
            }
        }
    func getStandings(){

        httpManager.downloadStandings(league: selectedLeague) { result in
            switch result {
      
            case .success(let data):
       
                DispatchQueue.main.async {
                    
                    
                    do {
                        let decoder = JSONDecoder()
                        let standingsResponse = try decoder.decode(StandingsData.self, from: data)
                        //print(standingsResponse)
                        self.standings = standingsResponse
                        print(self.standings?.league.atlanticDivision)
                    } catch {
                        print("Error in Download Standings! \(error)")
                        
                    }
                }
              
            case .failure(let error):
                print("Error: \(error)")
            }
        
        }
    }
    func getData(){
        var selectedTeam: any Team = NHLTeams.ARI
        switch(selectedLeague){
        case .NHL:
             selectedTeam = selectedNHLTeam
        case .AHL:
            selectedTeam = selectedAHLTeam
        case .KHL:
            selectedTeam = selectedKHLTeam
        }

        httpManager.downloadPlayerAndScheduleData(team: selectedTeam, league: selectedLeague) { result in
            switch result {
            case .success(let data):
       
                // to manage thread safety, changes to player data lead to changes in UI -> must be performed on main thread
                DispatchQueue.main.async {
                    
                    
                    do {
                        let decoder = JSONDecoder()
                        let playersResponse = try decoder.decode(PlayerStatsTeam.self, from: data)
                        let gameResponse = try decoder.decode(GameStatsTeam.self, from: data)
                       // print(gameResponse)
                        self.players = playersResponse
                        self.games = gameResponse
                        
                    } catch {
                        print("Error! \(error)")
                        
                    }
                  }
              
            case .failure(let error):
                print("Error: \(error)")
            }
        
        }
    }
}
