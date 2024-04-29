//
//  GameCardBody.swift
//  SportsTracker
//
//  Created by John Waslen on 2/28/24.
//

import SwiftUI
/*
 
 let id: String
 let awayTeamName: String
 let awayTeamShort: String
 let homeTeamName: String
 let homeTeamShort: String
 let date: Date
 let awayTeamScore: Int
 let homeTeamScore: Int
 let status: String
 
 */
struct GameCardBody: View {
    let game: GameStats
    let photos : [String] = ["TOR1","TOR2","TOR3"]
    @State var homeWinner: Bool
    @State var favouriteTeam: any Team
    
    var body: some View {
        VStack {
        HStack{
            Grid {
                GridRow {
                    Image("\(homeWinner ? game.homeTeamShort : game.awayTeamShort)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)

                        .frame(width: 30, height: 30)
                        .padding(.horizontal)
                    Text("\(homeWinner ? game.homeTeamName : game.awayTeamName) \(homeWinner ? "vs." : "at.")")
                        .foregroundStyle(.primary)
                        .font(.system(.title2, design: .rounded, weight: game.status == "final result" ? .bold : .regular))
                        .frame(maxWidth: .infinity)
                        .gridCellAnchor(.trailing)
                    Text("\(homeWinner ? game.homeTeamScore : game.awayTeamScore)")
                        .foregroundStyle(.primary)
                        .font(.system(.title2, design: .rounded, weight: game.status == "final result" ? .bold : .regular))
                        .gridCellAnchor(.trailing)
                    
                }
                
                GridRow {
                    Image("\(homeWinner ? game.awayTeamShort : game.homeTeamShort)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .padding(.horizontal)
                    Text("\(homeWinner ? game.awayTeamName : game.homeTeamName)")
                    
                        .foregroundStyle(.primary)
                    
                        .font(.system(.title3, design: .rounded, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .gridCellAnchor(.trailing)
                    Text("\(homeWinner ? game.awayTeamScore : game.homeTeamScore)")
                        .foregroundStyle(.primary)
                        .font(.system(.title3, design: .rounded, weight: .regular))
                    Spacer()
                    
                    
                }
                
                
            }.padding()
            VStack{
                Text("\(game.status == "final result" ? "Final" : game.status)")
                    .foregroundStyle(.primary)
                    .font(.system(.title3, design: .rounded, weight: game.status == "final result" ? .bold : .regular))
            }.padding(5)
            
        }
            
            let winningMessage = "\(game.homeTeamName) picks up a win at home, defeating \(game.awayTeamName) \(game.homeTeamScore)-\(game.awayTeamScore)"
            let losingMessage = "\(game.homeTeamName) falls at home, losing to \(game.awayTeamName) \(game.awayTeamScore)-\(game.homeTeamScore)"
   
            Text(homeWinner ? winningMessage : losingMessage)
                .foregroundStyle(.secondary)
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Image("\(photos.randomElement() ?? "")")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(RoundedRectangle(cornerRadius: 35))
            .frame(maxWidth: .infinity - 20)
            .padding()
        
    }
      
//        VStack (alignment: .leading, spacing: 10){
// 
//                HStack {
//                   
//                    VStack(alignment: .leading) {
//                        VStack(alignment: .leading){
//                            Image("\(homeWinner ? game.homeTeamShort : game.awayTeamShort)")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 25, height: 25)
//                            Image("\(homeWinner ? game.awayTeamShort : game.homeTeamShort)")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 25, height: 25)
//                        }
//                        Spacer()
//                        Text("\(homeWinner ? game.homeTeamName : game.awayTeamName) \(homeWinner ? "vs." : "at.")")
//                                .foregroundStyle(.primary)
//                                .font(.system(.title2, design: .rounded, weight: game.status == "final result" ? .bold : .regular))
//                         
//                        Text("\(homeWinner ? game.awayTeamName : game.homeTeamName)")
//               
//                                .foregroundStyle(.primary)
//
//                                .font(.system(.title3, design: .rounded, weight: .regular))
//               
//                       
//                    }
//                    Spacer()
//                        VStack(alignment: .trailing){
//                            Text("\(homeWinner ? game.homeTeamScore : game.awayTeamScore)")
//                                .foregroundStyle(.primary)
//                                .font(.system(.title2, design: .rounded, weight: game.status == "final result" ? .bold : .regular))
//                            Text("\(homeWinner ? game.awayTeamScore : game.homeTeamScore)")
//                                .foregroundStyle(.primary)
//                                .font(.system(.title3, design: .rounded, weight: .regular))
//                        }
//                    VStack{
//                        Text("\(game.status)")
//                            .foregroundStyle(.primary)
//                            .font(.system(.body, design: .rounded, weight: game.status == "final result" ? .bold : .regular))
//                    }
//                    
//                }.padding(.horizontal)
//             
//                 
////                Text("Max Domi scores two, Auston Matthew extends goal streak to five games with ten goals.")
////                    .foregroundStyle(.secondary)
////                    .lineLimit(3)
////                    .padding(.horizontal)
//       
//            
//              
////            Image("tor")
////                .resizable()
////                .aspectRatio(contentMode: .fit)
////                .clipShape(RoundedRectangle(cornerRadius: 25))
////                .padding()
//            
//            HStack {
//                HStack {
//                    Image(systemName: "arrowshape.up.circle.fill")
//                        .foregroundStyle(.green)
//                    Text("+3")
//                    Image(systemName: "arrowshape.down.circle.fill")
//                        .foregroundStyle(.red)
//                }
//                Spacer()
//                HStack {
//                    Image(systemName: "bubble.right")
//                      
//                    Text("13")
//                }
//               
//            }
//            .padding(.horizontal)
//            .font(.system(.title3))
//                .foregroundStyle(.primary)
//        } .padding(.horizontal)
    }
}

//#Preview {
//    GameCardBody(game: GameStats())
//}
