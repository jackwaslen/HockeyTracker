//
//  StandingsCardHeader.swift
//  SportsTracker
//
//  Created by John Waslen on 3/8/24.
//

import SwiftUI

struct StandingsCardHeader: View {
    @EnvironmentObject var viewModel : ViewModel
    @Binding var standingsView: standingsViewType
    
 
    var body: some View {
        HStack {
            Picker("League", selection: $viewModel.selectedLeague) {
                Text("NHL").tag(League.NHL)
                Text("AHL").tag(League.AHL)
                Text("KHL").tag(League.KHL)
            }
            .pickerStyle(.menu)
            
            Spacer()
            
            
            Picker("View", selection: $standingsView){
                Text("Conference").tag(standingsViewType.conference)
                Text("Division").tag(standingsViewType.division)
            }
            
        }.padding(.horizontal)
        
    }}

//#Preview {
//    let bool = false
//    StandingsCardHeader(conferenceView: bool.)
//        .environmentObject(ViewModel())
//    
//}
