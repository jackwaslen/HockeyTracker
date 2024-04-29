//
//  PlayerCardBody.swift
//  SportsTracker
//
//  Created by John Waslen on 2/29/24.
//

import SwiftUI

struct PlayerCardBody: View {
    @State var player: PlayerStats
    @State var team: any Team
    
    var body: some View {
      
            //GeometryReader { geo in
                VStack {
                    
                HStack {
              
                        Image("\(team.self)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.11, maxHeight: 150, alignment: .leading)
                            .padding(.top, UIScreen.main.bounds.height * 0.04)
                            .padding(.trailing, 5)
                    
                   
                    
                    Grid {
                    
                        GridRow {
                          
                            Text("\(player.name)")
                                .foregroundStyle(.primary)
                                .font(.system(.title3, design: .rounded, weight: .semibold))
                                .minimumScaleFactor(0.7)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .gridCellColumns(6)
                            Spacer()
                            
                            Text("\(player.pos)")
                                .foregroundStyle(.primary)
                                .font(.system(.title3, design: .rounded, weight: .semibold))
                                .minimumScaleFactor(0.7)
                                
                          
                               
                        }
                        GridRow {
                            
                            Text("G: ")
                                .foregroundStyle(.secondary)
                                .font(.system(.body, design: .rounded, weight: .semibold))
                            
                            Text("\(player.stats.goals)")
                                .foregroundStyle(.primary)
                                .font(.system(.body, design: .rounded, weight: .medium))
                            HStack {
                                Divider()
                                
                                
                            }
                            
                            Text("A:")
                                .foregroundStyle(.secondary)
                                .font(.system(.body, design: .rounded, weight: .semibold))
                            
                            Text("\(player.stats.assists)")
                                .foregroundStyle(.primary)
                                .font(.system(.body, design: .rounded, weight: .medium))
                            
                            HStack {
                                Divider()
                            }
                            
                            Text("Pts: ")
                                .foregroundStyle(.secondary)
                                .font(.system(.body, design: .rounded, weight: .semibold))
                            
                            Text("\(player.stats.points)")
                                .foregroundStyle(.primary)
                                .font(.system(.body, design: .rounded, weight: .bold))
                        }
                        GridRow {
                            Divider()
                                .gridColumnAlignment(.leading)
                                .frame(maxWidth: UIScreen.main.bounds.width * 0.725)
                                .gridCellColumns(8)
                                
                                
                        }
                        GridRow {
                            Text("GP: ")
                                .foregroundStyle(.secondary)
                                .font(.system(.body, design: .rounded, weight: .semibold))
                               
                            Text("\(player.stats.gp)")
                                .foregroundStyle(.primary)
                                .font(.system(.body, design: .rounded, weight: .medium))
                            HStack {
                                Divider()
                            
                             
                            }
                                
                            Text("GWG:")
                                .foregroundStyle(.secondary)
                                .font(.system(.body, design: .rounded, weight: .semibold))
                            
                                .minimumScaleFactor(0.7)
                                .frame(width: UIScreen.main.bounds.width * 0.1)
                            Text("\(player.stats.gwg)")
                                .foregroundStyle(.primary)
                                .font(.system(.body, design: .rounded, weight: .medium))
                            
                            HStack {
                                Divider()
                            }
                            
                            Text("PIM: ")
                                .foregroundStyle(.secondary)
                                .font(.system(.body, design: .rounded, weight: .semibold))
                                .minimumScaleFactor(0.7)
                               
                            Text("\(player.stats.penalty)")
                                .foregroundStyle(.primary)
                                .font(.system(.body, design: .rounded, weight: .semibold))
                        }
                  
                      
                        
                    }.frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.125)
                   
                }
                .frame(maxWidth: .infinity)
                .padding()
            }.frame(maxWidth: .infinity)
     //   }.frame(maxWidth: .infinity)
       
        
        
        
     
    }
}

#Preview {
    VStack {
        PlayerCardBody(player: PlayerStats(id: "12345", name: "William Nylander", injury: false, pos: "LW", bio: PlayerBio(born: "2022-10-10", hold: "L", kg: "100", cm: "183"), stats: PlayerStatsDetail(gp: "55", goals: "21", assists: "40", points: "71", penalty: "20", ppg: "3", shg: "32", gwg: "22")), team: NHLTeams.ANA)
    }
    
    
}
