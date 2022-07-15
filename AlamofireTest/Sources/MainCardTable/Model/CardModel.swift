//
//  CardModel.swift
//  AlamofireTest
//
//  Created by Denis Snezhko on 15.07.2022.
//

struct Cards: Decodable {
    let cards: [Card]
}

struct Card: Decodable {
    let name: String?
    let manaCost: String?
    let type: String?
    let rarity: String?
    let setName: String?
    let artist: String?
    let number: String?
    let imageUrl: String?
}
