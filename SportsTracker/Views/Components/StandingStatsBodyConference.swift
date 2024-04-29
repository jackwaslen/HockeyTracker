//
//  StandingStatsBodyConference.swift
//  SportsTracker
//
//  Created by John Waslen on 3/8/24.
//

import SwiftUI

struct StandingStatsBodyConference: View {
    @State var divisionPosition: Int
    @State var position: Int
    @State var teamStanding: TeamStandingsStats
    @State var wildcard: Bool
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        GridRow {
     
                Text("\(position)")
                    .foregroundStyle(.primary)
                    .font(.system(.headline, design: .rounded, weight: .semibold))
                    .minimumScaleFactor(0.8)
                    .frame(width: width * 0.045, height: height * 0.045)
                   
                Image("\(teamStanding.nameShort)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
   
                    .frame(width: width * 0.045, height: height * 0.045)
                    .padding(.trailing, width * 0.01)
            
            Text("\(teamStanding.nameShort)")
                .foregroundStyle(.primary)
 
                .font(.system(.headline, design: .rounded, weight: .semibold))
                .minimumScaleFactor(0.8)
                .frame(width: width * 0.105, height: height * 0.105)
            Group {
               

                
                Text("\(teamStanding.gp)")
                    .foregroundStyle(.primary)
                    .font(.system(.body, design: .rounded, weight: .regular))
                Text("\(teamStanding.wins)")
                    .foregroundStyle(.primary)
                    .font(.system(.body, design: .rounded, weight: .regular))
                
                Text("\(teamStanding.losses)")
                    .foregroundStyle(.primary)
                    .font(.system(.body, design: .rounded, weight: .regular))
                
           
                Text("\(teamStanding.OTL)")
                    .foregroundStyle(.primary)
                    .font(.system(.body, design: .rounded, weight: .regular))
                
                Text("\(teamStanding.points)")
                    .foregroundStyle(.primary)
                    .font(.system(.body, design: .rounded, weight: .bold))
                
            
            }
            
            Group {
                if wildcard {
                    Image(systemName: "dice.fill")
                        .foregroundStyle(.red)
                        .font(.system(.body, design: .rounded, weight: .bold))
                        .aspectRatio(contentMode: .fill)
                } else {
                    let systemImage = divisionPosition == 1 ? "trophy.fill" : divisionPosition == 2 || divisionPosition == 3 ? "checkmark.circle.fill" : nil
                    if let systemImage = systemImage {
                        Image(systemName: systemImage)
                            .foregroundStyle(divisionPosition == 1 ? .yellow : .green)
                            .font(.system(.body, design: .rounded, weight: .bold))
                            .aspectRatio(contentMode: .fill)
                        
                    }
//                    Image(systemName: divisionPosition == 1 ? "trophy.fill" : divisionPosition == 2 || divisionPosition == 3 ? "checkmark.circle.fill" : "")
//                        .foregroundStyle(divisionPosition == 1 ? .yellow : .green)
//                        .font(.system(.body, design: .rounded, weight: .bold))
//                        .aspectRatio(contentMode: .fill)
                }
            }
            .frame(width: width * 0.07, height: height * 0.07)
            

            
       
            Spacer()
        }
    }
}

//#Preview {
//    StandingStatsBodyConference()
//}
