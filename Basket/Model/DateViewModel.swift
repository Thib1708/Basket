//
//  DateViewModel.swift
//  Basket
//
//  Created by Thibault Giraudon on 04/03/2023.
//

import Foundation
import FirebaseDatabase

final class DateViewModel: ObservableObject {
    @Published var dates: [Date] = []
    
    private lazy var databasePath: DatabaseReference? = {
        let ref = Database.database().reference().child("dates")
        return ref
    }()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func listentoRealtimeDatabase() {
        guard let databasePath = databasePath else {
            return
        }
        databasePath
            .observe(.childAdded) { [weak self] snapshot in
                guard
                    let self = self,
                    var json = snapshot.value as? [String: Any]
                else {
                    return
                }
                json["id"] = snapshot.key
                do {
                    let dateData = try JSONSerialization.data(withJSONObject: json)
                    let date = try self.decoder.decode(Date.self, from: dateData)
                    self.dates.append(date)
                } catch {
                    print("an error occurred", error)
                }
            }
    }
    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
}
