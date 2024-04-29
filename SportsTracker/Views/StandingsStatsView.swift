//
//  StandingsStatsView.swift
//  SportsTracker
//
//  Created by John Waslen on 3/6/24.
//

import SwiftUI

struct StandingsStatsView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var standingsView : standingsViewType = .conference
    
   
    var body: some View {
        VStack {
            StandingsCardHeader(standingsView: $standingsView)
                .environmentObject(viewModel)
            
            if let standings = viewModel.standings {
                GeometryReader { geo in
            
                    if standingsView == .conference {
                        VStack {
                      
                            // .horizontal
                            ScrollView([.vertical]){
                                TableBodyConference(conferenceTitle: "Eastern Conference", conference: standings.league.easternConference, wildcard: standings.league.wildcardEastern, height: geo.size.height, width: geo.size.width)
                                TableBodyConference(conferenceTitle: "Western Conference", conference: standings.league.westernConference, wildcard: standings.league.wildcardWestern, height: geo.size.height, width: geo.size.width)

                            }
                           
                        }
                    } else {
                        VStack {
                           
                            ScrollView([.vertical]){
                                TableBodyDivision(divisionTitle: "Atlantic Division", division: standings.league.atlanticDivision, wildcard: standings.league.wildcardEastern, height: geo.size.height, width: geo.size.width)
                                TableBodyDivision(divisionTitle: "Metropolitan Division", division: standings.league.metroDivision, wildcard: standings.league.wildcardEastern , height: geo.size.height, width: geo.size.width)
                                TableBodyDivision(divisionTitle: "Central Division", division: standings.league.centralDivision, wildcard:  standings.league.wildcardWestern, height: geo.size.height, width: geo.size.width)
                                TableBodyDivision(divisionTitle: "Pacific Division", division: standings.league.pacificDivision, wildcard: standings.league.wildcardWestern, height: geo.size.height, width: geo.size.width)
                                
    //                            Grid {
    //                                Text("Atlantic Division")
    //                                    .foregroundStyle(.secondary)
    //                                    .font(.system(.headline, design: .rounded, weight: .semibold))
    //                                    .frame(maxWidth: .infinity, alignment: .leading)
    //                                    .padding(.leading)
    //                                Divider()
    //                                    GridRow {
    //                                        Group {
    //                                            // this is where position goes
    //                                            Text(" ")
    //
    //                                            // this is where the team logo goes
    //                                            Text(" ")
    //
    //                                            // this is where the team name goes
    //                                            Text(" ")
    //
    //                                            Text("GP")
    //
    //                                            Text("W")
    //
    //                                            Text("L")
    //
    //                                            Text("OTL")
    //
    //                                            Text("Pts")
    //
    //                                            Text("GF")
    //
    //                                            Text("GA")
    //                                        }
    //                                        .foregroundStyle(.secondary)
    //                                        .font(.system(.subheadline, design: .rounded, weight: .semibold)).frame(width: geo.size.width * 0.105, height: geo.size.width * 0.105)
    //
    //                                    }
    //                                    .frame(maxWidth: .infinity)
    //
    //
    //
    //                                    ForEach(standings.league.atlanticDivision.sorted(by: { $0.key < $1.key }), id: \.key) { position, team in
    //                                        StandingStatsBody(position: position, teamStanding: team)
    //                                            .padding(.leading, 5)
    //
    //                                        Divider()
    //
    //                                    }
    //                                }
    //                            Grid {
    //                                Text("Western Conference")
    //                                    .foregroundStyle(.secondary)
    //                                    .font(.system(.headline, design: .rounded, weight: .semibold))
    //                                    .frame(maxWidth: .infinity, alignment: .leading)
    //                                    .padding(.leading)
    //                                Divider()
    //                                    GridRow {
    //                                        Group {
    //                                            // this is where position goes
    //                                            Text(" ")
    //
    //                                            // this is where the team logo goes
    //                                            Text(" ")
    //
    //                                            // this is where the team name goes
    //                                            Text(" ")
    //
    //                                            Text("GP")
    //
    //                                            Text("W")
    //
    //                                            Text("L")
    //
    //                                            Text("OTL")
    //
    //                                            Text("Pts")
    //
    //                                            Text("GF")
    //
    //                                            Text("GA")
    //                                        }
    //                                        .foregroundStyle(.secondary)
    //                                        .font(.system(.subheadline, design: .rounded, weight: .semibold)).frame(width: geo.size.width * 0.105, height: geo.size.width * 0.105)
    //
    //                                    }
    //                                    .frame(maxWidth: .infinity)
    //
    //
    //
    //                                ForEach(standings.league.westernConference.sorted(by: { $0.key < $1.key }), id: \.key) { position, team in
    //                                        StandingStatsBody(position: position, teamStanding: team)
    //                                        .padding(.leading, 5)
    //                                        Divider()
    //
    //                                    }
    //                                }
                            }
                        }
                       
                    }
                    
                   
                    
                    
           
                }
    //            List {
    //                Section(header: Text("Eastern Conference")){
    //                    ForEach(standings.league.easternConference.sorted(by: { $0.key < $1.key }), id: \.key) { position, team in
    //                        StandingStatsBody(position: position, teamStanding: team)
    //
    //                    }.padding(5)
    //                }
    //                Section(header: Text("Western Conference")){
    //                    ForEach(standings.league.westernConference.sorted(by: { $0.key < $1.key }), id: \.key) { position, team in
    //                        StandingStatsBody(position: position, teamStanding: team)
    //
    //                    }.padding(5)
    //                }
    //            }.listStyle(.plain)
            }
        }

        
        
   
    }
}

#Preview {
    StandingsStatsView()
        .environmentObject(ViewModel())
}
