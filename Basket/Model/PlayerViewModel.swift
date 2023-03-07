//
//  PlayerViewModel.swift
//  Basket
//
//  Created by Thibault Giraudon on 04/03/2023.
//

import Foundation
import FirebaseDatabase

final class PlayerViewModel: ObservableObject {
    @Published var players: [Player] = []
    
    private lazy var databasePath: DatabaseReference? = {
        let ref = Database.database().reference().child("players")
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
                    let playerData = try JSONSerialization.data(withJSONObject: json)
                    let player = try self.decoder.decode(Player.self, from: playerData)
                    self.players.append(player)
                } catch {
                    print("an error occurred", error)
                }
            }
    }
    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
}
