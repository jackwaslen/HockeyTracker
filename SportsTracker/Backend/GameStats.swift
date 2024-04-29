//
//  GameStats.swift
//  SportsTracker
//
//  Created by John Waslen on 3/5/24.
//

import Foundation

struct GameStatsTeam: Codable, Identifiable {
    let id = UUID()
    var games: [GameStats]
    var scheduledGames: [GameStats]
    var playedGames: [GameStats]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let unsortedGames = try container.decode([GameStats].self, forKey: .games)
        self.games = unsortedGames.sorted()
        self.scheduledGames = games.filter { $0.status == "scheduled" }
        self.playedGames = games.filter { $0.status != "scheduled" }
    }
    

    
}

struct GameStats: Identifiable, Codable, Comparable, Equatable {
    static func < (lhs: GameStats, rhs: GameStats) -> Bool {
        return lhs.date > rhs.date
    }
    
    let id: String
    let awayTeamName: String
    let awayTeamShort: String
    let homeTeamName: String
    let homeTeamShort: String
    let date: Date
    let awayTeamScore: Int
    let homeTeamScore: Int
    let status: String
    
    
    enum GameStatsKeys: String, CodingKey {
          case id, awayTeamName = "team1long", homeTeamName = "team2long", awayTeamShort = "team1short", homeTeamShort = "team2short", date, score, status
      }
    
    enum ScoreKeys: String, CodingKey {
        case awayTeamScore = "goals1", homeTeamScore = "goals2", status
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: GameStatsKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        
        
        self.awayTeamName = try container.decode(String.self, forKey: .awayTeamName)
        self.homeTeamName = try container.decode(String.self, forKey: .homeTeamName)
        self.homeTeamShort = try container.decode(String.self, forKey: .homeTeamShort)
        self.awayTeamShort = try container.decode(String.self, forKey: .awayTeamShort)
        let dateString = try container.decode(String.self, forKey: .date)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.date = formatter.date(from: dateString) ?? Date()
        
        let scoreContainer = try container.nestedContainer(keyedBy: ScoreKeys.self, forKey: .score)
        let awayTeamScore = try scoreContainer.decode(String.self, forKey: .awayTeamScore)
        let homeTeamScore = try scoreContainer.decode(String.self, forKey: .homeTeamScore)
       
        self.homeTeamScore = Int(homeTeamScore) ?? -1
        self.awayTeamScore = Int(awayTeamScore) ?? -1
       
        self.status = try scoreContainer.decode(String.self, forKey: .status)
        
    }
    
}
