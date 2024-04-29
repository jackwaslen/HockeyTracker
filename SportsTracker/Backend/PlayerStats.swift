//
//  PlayerStats.swift
//  SportsTracker
//
//  Created by John Waslen on 2/29/24.
//

import Foundation

struct PlayerStatsTeam: Codable, Identifiable {
    let id = UUID()
    var players: [PlayerStats]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let unsortedPlayers = try container.decode([PlayerStats].self, forKey: .players)
        self.players = unsortedPlayers.sorted()
    }

    
}
struct PlayerStats: Codable, Identifiable, Comparable, Equatable {
    static func == (lhs: PlayerStats, rhs: PlayerStats) -> Bool {
        return positionValue(pos: lhs.pos) == positionValue(pos: rhs.pos) && lhs.name == rhs.name
    }
    
    let id: String
    let name: String
    let injury: Bool
    let pos: String
    let bio: PlayerBio
    let stats: PlayerStatsDetail
    
    enum CodingKeys: String, CodingKey {
          case id, name, injury, pos, bio, stats
      }
    
    init(id: String, name: String, injury: Bool, pos: String, bio: PlayerBio, stats: PlayerStatsDetail){
        self.id = id
        self.name = name
        self.injury = injury
        self.pos = pos
        self.bio = bio
        self.stats = stats
    }
      
    init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
          id = try container.decode(String.self, forKey: .id)
          name = try container.decode(String.self, forKey: .name)
         
          do {
             let injuryInt = try container.decode(Int.self, forKey: .injury)
              injury = injuryInt == 0 ? false : true
            }
          catch {
            injury = true
          }
          pos = try container.decode(String.self, forKey: .pos)
          bio = try container.decode(PlayerBio.self, forKey: .bio)
          stats = try container.decode(PlayerStatsDetail.self, forKey: .stats)
    }
    
    static func < (lhs: PlayerStats, rhs: PlayerStats) -> Bool {
          // calculate position priorities
          let leftPostionValue = positionValue(pos: lhs.pos)
          let rightPositionValue = positionValue(pos: rhs.pos)
        
          // different positions return greater priority
            if positionValue(pos: lhs.pos) != positionValue(pos: rhs.pos) {
                return leftPostionValue < rightPositionValue
            } else {
                // sort on gp if same position
                return Int(lhs.stats.gp) ?? 0 > Int(rhs.stats.gp) ?? 0
            }
      }
    static func positionValue(pos: String) -> Int{
        switch pos {
                case "CE":
                    return 0 // For forwards
                case "LW":
                    return 1
                case "RW":
                    return 2
                case "D":
                    return 3 // For defensemen
                case "G":
                    return 4 // For goaltenders
                default:
                    return 5 // For other positions (if any)
                }
    }

    
}

struct PlayerBio: Codable {
    let born: String
    let hold: String
    let kg: String
    let cm: String
    
    enum CodingKeys: String, CodingKey {
            case born, hold, kg, cm
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            born = try container.decode(String.self, forKey: .born)
            hold = try container.decode(String.self, forKey: .hold)
            kg = try container.decode(String.self, forKey: .kg)
            cm = try container.decode(String.self, forKey: .cm)
        }
    
    init(born: String, hold: String, kg: String, cm: String) {
        self.born = born
        self.hold = hold
        self.kg = kg
        self.cm = cm
    }
    
}

struct PlayerStatsDetail: Codable {
    let gp: String
    let goals: String
    let assists: String
    let points: String
    let penalty: String
    let ppg: String
    let shg: String
    let gwg: String
    
    enum CodingKeys: String, CodingKey {
            // assists is labelled as asists in API
            case gp, goals, assists = "asists", points, penalty, ppg, shg, gwg
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            gp = try container.decode(String.self, forKey: .gp)
            goals = try container.decode(String.self, forKey: .goals)
            // assists is labelled as asists in API
            assists = try container.decode(String.self, forKey: .assists)
            points = try container.decode(String.self, forKey: .points)
            penalty = try container.decode(String.self, forKey: .penalty)
            ppg = try container.decode(String.self, forKey: .ppg)
            shg = try container.decode(String.self, forKey: .shg)
            gwg = try container.decode(String.self, forKey: .gwg)
        }
    
    
    init(gp: String, goals: String, assists: String, points: String, penalty: String, ppg:String, shg: String, gwg:String) {
        self.gp = gp
        self.goals = goals
        self.assists = assists
        self.points = points
        self.penalty = penalty
        self.ppg = ppg
        self.shg = shg
        self.gwg = gwg
    }
}
