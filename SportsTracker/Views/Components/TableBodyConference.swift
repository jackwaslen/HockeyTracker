//
//  TableBodyConference.swift
//  SportsTracker
//
//  Created by John Waslen on 3/8/24.
//

import SwiftUI

struct TableBodyConference: View {
    @State var conferenceTitle: String
    @State var conference: [Int : TeamStandingsStats]
    @State var wildcard: [Int : TeamStandingsStats]
    let height: CGFloat
    let width: CGFloat

    
    init(conferenceTitle: String, conference: [Int : TeamStandingsStats], wildcard: [Int : TeamStandingsStats], height: CGFloat, width: CGFloat) {
        self.conferenceTitle = conferenceTitle
        self.conference = conference
        self.height = height
        self.width = width
        self.wildcard = wildcard

    }
    var body: some View {
        Grid {
            Text("\(conferenceTitle)")
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
                        
                  
       
    
                    }
                    .foregroundStyle(.secondary)
                    .font(.system(.subheadline, design: .rounded, weight: .semibold)).frame(width: width * 0.09, height: height * 0.09)
                
               
                }
                .frame(maxWidth: .infinity)
         
                
            Divider()
        
            ForEach(conference.sorted(by: { $0.key < $1.key }), id: \.key) { position, team in
                // Division Leaders depend on order in their respective division, Wildcard depends on a different calculation.
                let wildcard = wildcard.contains(where: { $0.value.nameShort == team.nameShort})
                
                
                // To be implemented later
                StandingStatsBodyConference(divisionPosition: 0, position: position, teamStanding: team, wildcard: false, width: width, height: height)
              
                   
                    Divider()
                
                    
                }

            
        }.padding(.horizontal)
    }
}

//#Preview {
//    TableBodyConference()
//}
