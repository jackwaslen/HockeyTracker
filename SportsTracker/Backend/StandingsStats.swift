//
//  StandingsStats.swift
//  SportsTracker
//
//  Created by John Waslen on 3/6/24.
//

import Foundation
struct StandingsData: Codable {
    let league: StandingsConferenceData

    private enum CodingKeys: String, CodingKey {
        case league = "conference"
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.league = try container.decode(StandingsConferenceData.self, forKey: .league)
    }
}

struct StandingsConferenceData: Codable {
    let westernConference: [Int: TeamStandingsStats]
    let easternConference: [Int: TeamStandingsStats]
    
    let atlanticDivision:  [Int: TeamStandingsStats]
    let metroDivision:  [Int: TeamStandingsStats]
    let centralDivision:  [Int: TeamStandingsStats]
    let pacificDivision:  [Int: TeamStandingsStats]
    let wildcardEastern:  [Int: TeamStandingsStats]
    let wildcardWestern:  [Int: TeamStandingsStats]
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.westernConference = try container.decode([Int: TeamStandingsStats].self, forKey: .westernConference)
            self.easternConference = try container.decode([Int: TeamStandingsStats].self, forKey: .easternConference)
            
        self.atlanticDivision = Dictionary(uniqueKeysWithValues: self.easternConference.filter { ["FLA","BOS","TOR","DET","TBL","BUF","MTL","OTT"].contains($0.value.nameShort) }
            .sorted { $0.value.points > $1.value.points })
        
        self.metroDivision = Dictionary(uniqueKeysWithValues: self.easternConference.filter { ["NYR","CAR","PHI","NYI","WSH","PIT","NJD","CBJ"].contains($0.value.nameShort) }
            .sorted { $0.value.points > $1.value.points })
        
        self.centralDivision = Dictionary(uniqueKeysWithValues: self.westernConference.filter { ["DAL","WPG","COL","NSH","STL","MIN","ARI","CHI"].contains($0.value.nameShort) }
            .sorted { $0.value.points > $1.value.points })
        
        self.pacificDivision = Dictionary(uniqueKeysWithValues: self.westernConference.filter { ["VAN","EDM","LAK","VGK","SEA","CGY","ANA","SJS"].contains($0.value.nameShort) }
            .sorted { $0.value.points > $1.value.points })
        
        // Each Division take Four to Eight
        // Filter on Most points top 2
        // Repeat for each conference
        var easternWildcardStandings : [Int: TeamStandingsStats]  = [:]
        var westernWildcardStandings : [Int: TeamStandingsStats]  = [:]
        for division in [self.atlanticDivision, self.centralDivision, self.metroDivision, self.pacificDivision] {
            let top3Teams = division.sorted(by: { $0.key < $1.key }).prefix(3).map { $0.key }
            let divisionFourToEight = division.filter { !top3Teams.contains($0.key) }
            if division == self.atlanticDivision || division == self.metroDivision {
                for team in divisionFourToEight {
                    easternWildcardStandings.updateValue(team.value, forKey: team.key)
                }
            }
            if division == self.centralDivision || division == self.pacificDivision {
                for team in divisionFourToEight {
                    westernWildcardStandings.updateValue(team.value, forKey: team.key)
                }
            }
        }
     
        let top2TeamsEastern = easternWildcardStandings.sorted(by: { $0.key < $1.key }).prefix(2)
        let top2TeamsWestern = westernWildcardStandings.sorted(by: { $0.key < $1.key }).prefix(2)
        
        self.wildcardEastern = Dictionary(uniqueKeysWithValues: top2TeamsEastern.map { ($0.key, $0.value) })
        self.wildcardWestern = Dictionary(uniqueKeysWithValues: top2TeamsWestern.map { ($0.key, $0.value) })

        }
    
    init(westernConference: [Int : TeamStandingsStats], easternConference: [Int : TeamStandingsStats], atlanticDivision: [Int : TeamStandingsStats], metroDivision: [Int : TeamStandingsStats], centralDivision: [Int : TeamStandingsStats], pacificDivision: [Int : TeamStandingsStats], wildcardEastern: [Int : TeamStandingsStats], wildcardWestern: [Int : TeamStandingsStats]) {
        self.westernConference = westernConference
        self.easternConference = easternConference
        
        self.atlanticDivision = Dictionary(uniqueKeysWithValues: self.easternConference.filter { ["FLA","BOS","TOR","DET","TBL","BUF","MTL","OTT"].contains($0.value.nameShort) }
            .sorted { $0.value.points > $1.value.points })
        
        self.metroDivision = Dictionary(uniqueKeysWithValues: self.easternConference.filter { ["NYR","CAR","PHI","NYI","WSH","PIT","NJD","CBJ"].contains($0.value.nameShort) }
            .sorted { $0.value.points > $1.value.points })
        
        self.centralDivision = Dictionary(uniqueKeysWithValues: self.easternConference.filter { ["DAL","WPG","COL","NSH","STL","MIN","ARI","CHI"].contains($0.value.nameShort) }
            .sorted { $0.value.points > $1.value.points })
        
        self.pacificDivision = Dictionary(uniqueKeysWithValues: self.easternConference.filter { ["VAN","EDM","LAK","VGK","SEA","CGY","ANA","SJS"].contains($0.value.nameShort) }
            .sorted { $0.value.points > $1.value.points })
        
        // update division standings
        var easternWildcardStandings : [Int: TeamStandingsStats]  = [:]
        var westernWildcardStandings : [Int: TeamStandingsStats]  = [:]
        for division in [self.atlanticDivision, self.centralDivision, self.metroDivision, self.pacificDivision] {
            let top3Teams = division.sorted(by: { $0.key < $1.key }).prefix(3).map { $0.key }
            let divisionFourToEight = division.filter { !top3Teams.contains($0.key) }
            if division == self.atlanticDivision || division == self.metroDivision {
                for team in divisionFourToEight {
                    easternWildcardStandings.updateValue(team.value, forKey: team.key)
                }
            }
            if division == self.centralDivision || division == self.pacificDivision {
                for team in divisionFourToEight {
                    westernWildcardStandings.updateValue(team.value, forKey: team.key)
                }
            }
        }
     
        let top2TeamsEastern = easternWildcardStandings.sorted(by: { $0.key < $1.key }).prefix(2)
        let top2TeamsWestern = westernWildcardStandings.sorted(by: { $0.key < $1.key }).prefix(2)
        
        self.wildcardEastern = Dictionary(uniqueKeysWithValues: top2TeamsEastern.map { ($0.key, $0.value) })
        self.wildcardWestern = Dictionary(uniqueKeysWithValues: top2TeamsWestern.map { ($0.key, $0.value) })
        
    }
    enum CodingKeys: String, CodingKey {
        case westernConference = "Western conference"
        case easternConference = "Eastern conference"
        case atlanticDivision
        case metroDivision
        case centralDivision
        case pacificDivision
    }
}

struct TeamStandingsStats : Codable, Equatable {
    let nameShort: String
    let nameLong: String
    let gp: String
    let wins: String
    let OTL: String
    let losses: String
    let goalsFor: String
    let goalsAgainst: String
    let points: String
    let clinch: Bool
    
    enum CodingKeys : String, CodingKey {
        // score is broken up into goals for and goals agaimnt
        case nameShort = "shortname", nameLong = "longname", gp, wins, losses = "losts", score, points, clinch
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.nameShort = try container.decode(String.self, forKey: .nameShort)
        self.nameLong = try container.decode(String.self, forKey: .nameLong)
        self.gp = try container.decode(String.self, forKey: .gp)
        self.wins = try container.decode(String.self, forKey: .wins)
        self.losses = try container.decode(String.self, forKey: .losses)
        let score = try container.decode(String.self, forKey: .score)
        let scoreComponents = score.components(separatedBy: ":")
        self.goalsFor = scoreComponents[0]
        self.goalsAgainst = scoreComponents[1]
        self.points = try container.decode(String.self, forKey: .points)
        do {
            let clinch = try container.decode(String.self, forKey: .clinch)
            self.clinch = clinch == "0" ? true : false
        } catch {
            self.clinch = false
        }
        
        // Problem: this database doesnt have Overtime Losses (OTL). We can do some math to determine OTL.
        if let points = Int(self.points), let wins = Int(self.wins){
            let OTLPoints = points - (wins * 2)
            // Each OTL gives the team 1 point, so OTLPoints = Total Overtime Losses
            self.OTL = String(OTLPoints)
        } else {
            self.OTL = String(0)
        }
       
        
    }
    
    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(nameShort, forKey: .nameShort)
            try container.encode(nameLong, forKey: .nameLong)
            try container.encode(gp, forKey: .gp)
            try container.encode(wins, forKey: .wins)
            try container.encode(losses, forKey: .losses)
            let score = "\(goalsFor):\(goalsAgainst)"
            try container.encode(score, forKey: .score)
            try container.encode(points, forKey: .points)
            try container.encode(clinch, forKey: .clinch)
        }
}
