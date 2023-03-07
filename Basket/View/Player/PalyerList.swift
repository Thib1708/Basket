//
//  PlayerList.swift
//  Basket
//
//  Created by Thibault Giraudon on 27/02/2023.
//

import SwiftUI

//struct PlayerList: View {
//    @StateObject var viewModel = PlayerViewModel()
//    var body: some View {
//        List (viewModel.player) { player in
//            NavigationLink {
//                ScrollView{
//                    VStack {
//                        Image("bcmf")
//                            .ignoresSafeArea(edges: .top)
//                            .frame(height: 300)
//                        
//                        PlayerImage(image: player.image)
//                            .offset(y: -130)
//                            .padding(.bottom, -130)
//                        
//                        VStack(alignment: .leading) {
//                            Text(player.name)
//                                .font(.title)
//                            Text(player.total_scored)
//                            HStack {
//                                Text(player.post)
//                                Spacer()
//                                Text(player.weight)
//                            }
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
//                        }
//                        .padding()
//                    }
//                    .navigationTitle(player.name)
//                    .navigationBarTitleDisplayMode(.inline)
//                    .ignoresSafeArea()
//                }
//            } label: {
//                HStack {
//                    player.image
//                        .resizable()
//                        .frame(width: 35, height: 50)
//                    Text(player.name)
//        
//                    Spacer()
//                }
//            }
//        }
//        .navigationTitle("BCMF")
//    }
//}
//
//struct PlayerList_Previews: PreviewProvider {
//    static var previews: some View {
//       PlayerList()
//    }
//}
