//
//  GameDetailResponse.swift
//  SportsTracker
//
//  Created by John Waslen on 3/10/24.
//

import Foundation

struct GameDetail : Decodable {
    let team1short: String
    let team1long : String
    let team2short: String
    let team2long : String
    let id : String
    
    let team1goals: String
    let team2goals: String
    let status    : String
    let goals : [goalDetail]
    let penalties : [penaltiesDetail]
    let lastFiveGames : [lastFiveGames]
    let lastFiveHeadToHead : [lastFiveHeadToHead]
}
struct goalDetail : Decodable {
    let time : String
    let teamShort: String
    let goaler : String
    let assists : [String]
    let score : String
    let powerPlay : Bool
    
    enum CodingKeys: CodingKey {
        case time
        case teamShort
        case goaler
        case asister1
        case asister2
        case score
        case when
    }
    
    init(time: String, teamShort: String, goaler: String, assists: [String], score: String, powerPlay: Bool) {
        self.time = time
        self.teamShort = teamShort
        self.goaler = goaler
        self.assists = assists
        self.score = score
        self.powerPlay = powerPlay
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.time = try container.decode(String.self, forKey: .time)
        self.teamShort = try container.decode(String.self, forKey: .teamShort)
        self.goaler = try container.decode(String.self, forKey: .goaler)
        let assist1 = try container.decode(String.self, forKey: .asister1)
        let assist2 = try container.decode(String.self, forKey: .asister2)
        self.assists = assist2 != "no assist" ? [assist1, assist2] : [assist1]
        self.score = try container.decode(String.self, forKey: .score)
        let when = try container.decode(String.self, forKey: .when)
        self.powerPlay = when == "normal" ? false : true
    }
  
}

struct penaltiesDetail : Decodable  {
    let time : String
    let teamShort : String
    let player : String
    let minutes : String
    let penaltyType : String
    
    enum CodingKeys: CodingKey {
        case time
        case teamShort
        case player
        case minutes
        case penaltyType
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.time = try container.decode(String.self, forKey: .time)
        self.teamShort = try container.decode(String.self, forKey: .teamShort)
        self.player = try container.decode(String.self, forKey: .player)
        self.minutes = try container.decode(String.self, forKey: .minutes)
        self.penaltyType = try container.decode(String.self, forKey: .penaltyType)
    }
}

// last 5 games
struct lastFiveGames : Decodable {
    let opponent : String
    let home : Bool
    let score : String
    let win : Bool
    
    enum CodingKeys: String, CodingKey {
        case opponent = "versus"
        case home = "where"
        case score
        case win = "result"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.opponent = try container.decode(String.self, forKey: .opponent)
        let location = try container.decode(String.self, forKey: .home)
        self.home = location == "home" ? true : false
        self.score = try container.decode(String.self, forKey: .score)
        let result = try container.decode(String.self, forKey: .win)
        self.win = result == "win" ? true : false
    }

}
struct lastFiveHeadToHead : Decodable {
    let team1Wins : String
    let team2Wins : String
    let team1Goals : String
    let team2Goals : String
    
    enum CodingKeys: CodingKey {
        case last5head2head
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let fiveGameArray = try container.decode([lastFiveHeadToHeadGame].self, forKey: .last5head2head)
        var team1Wins = 0
        var team1Goals = 0
        var team2Wins = 0
        var team2Goals = 0
        for game in fiveGameArray {
            if game.winner == "1"{
                team1Wins = team1Wins + 1
                team1Goals = Int(game.score.components(separatedBy: ":")[0]) ?? 0
            } else {
                team2Wins = team2Wins + 1
                team2Wins = Int(game.score.components(separatedBy: ":")[0]) ?? 0

            }
               
        }
        self.team1Wins = String(team1Wins)
        self.team2Wins = String(team2Wins)
        self.team1Goals = String(team1Goals)
        self.team2Goals = String(team2Goals)
    }
}

struct lastFiveHeadToHeadGame : Decodable {
    let score : String
    let winner : String
    
}


