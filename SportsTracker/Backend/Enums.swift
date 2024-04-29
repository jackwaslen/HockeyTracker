//
//  Enums.swift
//  SportsTracker
//
//  Created by John Waslen on 2/29/24.
//

import Foundation

enum League: String, CaseIterable, Identifiable {
    case NHL, AHL, KHL
    var id: Self { self }
}
enum NHLTeams: String, Team {
    
        case ANA = "Anaheim Ducks"
        case ARI = "Arizona Coyotes"
        case BOS = "Boston Bruins"
        case BUF = "Buffalo Sabres"
        case CGY = "Calgary Flames"
        case CAR = "Carolina Hurricanes"
        case CHI = "Chicago Blackhawks"
        case COL = "Colorado Avalanche"
        case CBJ = "Columbus Blue Jackets"
        case DAL = "Dallas Stars"
        case DET = "Detroit Red Wings"
        case EDM = "Edmonton Oilers"
        case FLA = "Florida Panthers"
        case LAK = "Los Angeles Kings"
        case MIN = "Minnesota Wild"
        case MTL = "Montreal Canadiens"
        case NSH = "Nashville Predators"
        case NJD = "New Jersey Devils"
        case NYI = "New York Islanders"
        case NYR = "New York Rangers"
        case OTT = "Ottawa Senators"
        case PHI = "Philadelphia Flyers"
        case PIT = "Pittsburgh Penguins"
        case SJS = "San Jose Sharks"
        case SEA = "Seattle Kraken"
        case STL = "St. Louis Blues"
        case TBL = "Tampa Bay Lightning"
        case TOR = "Toronto Maple Leafs"
        case VAN = "Vancouver Canucks"
        case VGK = "Vegas Golden Knights"
        case WSH = "Washington Capitals"
        case WPG = "Winnipeg Jets"
   

}
enum AHLTeams: String, Team {

    
    case ABB = "Abbotsford Canucks"
    case BAK = "Bakersfield Condors"
    case BEL = "Belleville Senators"
    case BRG = "Bridgeport Islanders"
    case CHA = "Charlotte Checkers"
    case CHI = "Chicago Wolves"
    case CLE = "Cleveland Monsters"
    case COL = "Colorado Eagles"
    case CVF = "Coachella Valley Firebirds"
    case GR = "Grand Rapids Griffins"
    case HFD = "Hartford Wolf Pack"
    case HER = "Hershey Bears"
    case HSK = "Henderson Silver Knights"
    case IA = "Iowa Wild"
    case LAV = "Laval Rocket"
    case LVP = "Lehigh Valley Phantoms"
    case MB = "Manitoba Moose"
    case MIL = "Milwaukee Admirals"
    case ONT = "Ontario Reign"
    case PRO = "Providence Bruins"
    case RCH = "Rochester Americans"
    case RFD = "Rockford IceHogs"
    case SD = "San Diego Gulls"
    case SJ = "San Jose Barracuda"
    case SPR = "Springfield Thunderbirds"
    case SYR = "Syracuse Crunch"
    case TEX = "Texas Stars"
    case TOR = "Toronto Marlies"
    case TUC = "Tucson Roadrunners"
    case UTI = "Utica Comets"
    case WBS = "Wilkes-Barre/Scranton Penguins"
    


}
enum KHLTeams: String, Team {

    
    case AKB = "Ak Bars Kazan"
    case ADM = "Admiral Vladivostok"
    case AMU = "Amur Khabarovsk"
    case AVA = "Avangard Omsk"
    case AVT = "Avtomobilist Yekaterinburg"
    case BAR = "Barys Astana"
    case CSK = "CSKA Moscow"
    case DIN = "Dinamo Minsk"
    case DYN = "Dynamo Moscow"
    case KUN = "Red Star Kunlun"
    case LAD = "Lada Togliatti"
    case LOK = "Lokomotiv Yaroslavl"
    case MET = "Metallurg Magnitogorsk"
    case NEF = "Neftekhimik Nizhnekamsk"
    case SAL = "Salavat Yulaev Ufa"
    case SEV = "Severstal Cherepovets"
    case SIB = "Sibir Novosibirsk"
    case SKA = "SKA Saint Petersburg"
    case SOC = "HC Sochi"
    case SPA = "Spartak Moscow"
    case TOR = "Torpedo Nizhny Novgorod"
    case TRA = "Traktor Chelyabinsk"
    case VIT = "HC Vityaz"
    
}
enum standingsViewType : Equatable {
    case conference
    case division
}


protocol Team: CaseIterable, Identifiable {
    
    var id: String { get }
    var name: String { get }
    var league: League { get }
}

extension NHLTeams {
    var id: String { return rawValue }
    var name: String { return rawValue }
    var league: League { return .NHL }
}

extension AHLTeams {
    var id: String { return rawValue }
    var name: String { return rawValue }
    var league: League { return .AHL }
}

extension KHLTeams {
    var id: String { return rawValue }
    var name: String { return rawValue }
    var league: League { return .KHL }
}


func selectTeam(teamName: String, league : League) -> any Team {
    switch league {
    case .NHL:
        return NHLTeams(rawValue: teamName) ?? NHLTeams.ANA
    case .AHL:
        return AHLTeams(rawValue: teamName) ?? AHLTeams.ABB
    case .KHL:
        return KHLTeams(rawValue: teamName) ?? KHLTeams.ADM
    default:
        print("Failed to Return Team, check values")
        return NHLTeams.ANA
    }
}

//func convertToNHLTeam(team: Team) -> NHLTeams {
//    if let nhlTeam = team as? NHLTeams {
//        return "NHL Team: \(nhlTeam.rawValue)"
//    } else if let ahlTeam = team as? AHLTeams {
//        return "AHL Team: \(ahlTeam.rawValue)"
//    } else if let khlTeam = team as? KHLTeams {
//        return "KHL Team: \(khlTeam.rawValue)"
//    } else {
//        return "Unknown Team"
//    }
//}
