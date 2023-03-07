//
//  ClubViewModel.swift
//  Basket
//
//  Created by Thibault Giraudon on 04/03/2023.
//

import Foundation
import FirebaseDatabase

final class ClubViewModel: ObservableObject {
    var clubs: [Club] = []
    
    private lazy var databasePath: DatabaseReference? = {
        let ref = Database.database().reference().child("clubs")
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
                    let clubData = try JSONSerialization.data(withJSONObject: json)
                    let club = try self.decoder.decode(Club.self, from: clubData)
                    self.clubs.append(club)
                } catch {
                    print("an error occurred", error)
                }
            }
    }
    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
}
