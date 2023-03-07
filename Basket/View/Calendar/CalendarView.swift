//
//  CalendarView.swift
//  Basket
//
//  Created by Thibault Giraudon on 28/02/2023.
//

import SwiftUI
import EventKit

struct CalendarView: View {
    @StateObject private var viewModel = DateViewModel()
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            VStack {
                CalendarTitle()
                Divider()
                ForEach(viewModel.dates) { date in
                    HStack{
                        Text(date.date)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.height * (0.04))
                            .font(.system(size: 7))
                        Text(date.hour)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.height * (0.04))
                            .font(.system(size: 7))
                        Text(date.team1)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.height * (0.15))
                            .font(.system(size: 7))
                        Text(date.team2)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.height * (0.15))
                            .font(.system(size: 7))
                        Text(date.result)
                
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.height * (0.05))
                            .font(.system(size: 7))
                    }
                    Divider()
                }
            }
        }
        else {
            Table(viewModel.dates) {
                TableColumn("Date", value: \.date)
                    .width(UIScreen.main.bounds.height * (0.1))
                TableColumn("Heure", value: \.hour)
                    .width(UIScreen.main.bounds.height * (0.05))
                TableColumn("Domicile", value: \.team1)
                TableColumn("Visiteur", value: \.team2)
                TableColumn("Resultat", value: \.result)
                    .width(UIScreen.main.bounds.height * (0.07))
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
