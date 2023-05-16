//
//  Card.swift
//  Petz
//
//  Created by Camilo Oscar Girardelli Baptista on 15/05/23.
//

import UIKit

struct Card: Decodable {
    var img: String?
    var name: String?
    var faction: String?
    var cardSet: String?
    var type: String?
    var health: String?
    var rarity: String?
    var text: String?
    var armor: String?
}
