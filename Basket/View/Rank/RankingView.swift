//
//  RankingView.swift
//  Basket
//
//  Created by Thibault Giraudon on 27/02/2023.
//

import SwiftUI

struct RankingView: View {
    private var idiom : UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }

    @StateObject private var viewModel = ClubViewModel()
//    private var sortedclub: [Club] {
//        viewModel.club.sorted { $0.rank < $1.rank }
//    }
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            VStack {
                RankTitle()
                Divider()
                ForEach(viewModel.clubs) { club in
                    HStack{
                        Text(club.name)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.height * (0.20))
                            .font(.system(size: 7))
                        Text(club.pts)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.height * (0.02))
                            .font(.system(size: 7))
                        Text(club.play)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.height * (0.02))
                            .font(.system(size: 7))
                        Text(club.win)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.height * (0.02))
                            .font(.system(size: 7))
                        Text(club.loose)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.height * (0.02))
                            .font(.system(size: 7))
                        Text(club.null)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.height * (0.02))
                            .font(.system(size: 7))
                        Text(club.scored)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.height * (0.02))
                            .font(.system(size: 7))
                        Text(club.taken)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.height * (0.02))
                            .font(.system(size: 7))
                        Text(club.diff)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.height * (0.02))
                            .font(.system(size: 7))
                    }
                    Divider()
                }
            }
        }
        else {
            VStack {
                Spacer()
                Table(viewModel.clubs) {
                    TableColumn("Equipe", value: \.name)
                        .width(UIScreen.main.bounds.height * (0.25))
                    TableColumn("Pts", value: \.pts)
                    TableColumn("J", value: \.play)
                    TableColumn("G", value: \.win)
                    TableColumn("P", value: \.loose)
                    TableColumn("N", value: \.null)
                    TableColumn("M", value: \.scored)
                    TableColumn("E", value: \.taken)
                    TableColumn("D", value: \.diff)
                }
            }
        }
    }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}
