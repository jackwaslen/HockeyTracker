//
//  TableBody.swift
//  SportsTracker
//
//  Created by John Waslen on 3/7/24.
//

import SwiftUI

struct TableBodyDivision: View {
    @State var divisionTitle: String
    @State var division: [Int : TeamStandingsStats]
    @State var wildcard: [Int : TeamStandingsStats]
    let height: CGFloat
    let width: CGFloat
    let orderedDivision: [Int : TeamStandingsStats]
    
    init(divisionTitle: String, division: [Int : TeamStandingsStats], wildcard: [Int : TeamStandingsStats], height: CGFloat, width: CGFloat) {
        self.divisionTitle = divisionTitle
        self.division = division
        self.height = height
        self.width = width
        self.wildcard = wildcard
        
        let sortedTeams = division.sorted { $0.key < $1.key }

        // Create a new dictionary with consecutive integer keys starting from 1
        self.orderedDivision = Dictionary(uniqueKeysWithValues: sortedTeams.enumerated().map { ($0.offset + 1, $0.element.value) })
    }
    var body: some View {
        Grid {
            Text("\(divisionTitle)")
                .foregroundStyle(.secondary)
                .font(.system(.headline, design: .rounded, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
               // .padding(.leading)
   
            Divider()
                GridRow {
                    Text("Team")
                        .foregroundStyle(.secondary)
                        .font(.system(.subheadline, design: .rounded, weight: .semibold))
                        .frame(width: width * 0.12, height: height * 0.08, alignment: .center)
                    
                    Group {
                     
                        Text(" ")
                        
                        Text(" ")
                        
                        Text("GP")

                        Text("W")
         
                        Text("L")

                        Text("OTL")
        
                        Text("Pts")
                        
                        Text("Pos")
                  
                        // 8 * 0.05 = 0.4
    
                    }
                    .foregroundStyle(.secondary)
                    .font(.system(.subheadline, design: .rounded, weight: .semibold)).frame(width: width * 0.075, height: height * 0.075)
                
               
                }
                .frame(maxWidth: .infinity)
         
                
            Divider()
        
            ForEach(orderedDivision.sorted(by: { $0.key < $1.key }), id: \.key) { position, team in
                // Division Leaders depend on order in their respective division, Wildcard depends on a different calculation.
                let wildcard = wildcard.contains(where: { $0.value.nameShort == team.nameShort})
                StandingStatsBody(position: position, teamStanding: team, wildcard: wildcard, width: width, height: height)
                   
                    Divider()
                
                    
                }

            
        }.padding(.horizontal)
    }
}

//#Preview {
//    TableBody()
//}
