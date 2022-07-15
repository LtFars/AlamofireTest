//
//  MainCardTableViewControllerInput.swift
//  AlamofireTest
//
//  Created by Denis Snezhko on 15.07.2022.
//

import Foundation

protocol MainCardTableViewControllerInput: AnyObject {
    func updateCards(with cards: [Card])
}
