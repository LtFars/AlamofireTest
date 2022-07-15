//
//  MainCardTablePresenter.swift
//  AlamofireTest
//
//  Created by Denis Snezhko on 15.07.2022.
//

import Foundation
import Alamofire

final class MainCardTablePresenter {
    
    // MARK: - Elements
    
    private weak var view: MainCardTableViewControllerInput?
    private let dispatchGroup = DispatchGroup()
    private var cards = [Card]()
    
    // MARK: - Init
    
    init(view: MainCardTableViewControllerInput) {
        self.view = view
    }
}

// MARK: - MainViewControllerOutput

extension MainCardTablePresenter: MainCardTableViewControllerOutput {
    
    func fetchCards() {
        dispatchGroup.enter()
        let request = AF.request("https://api.magicthegathering.io/v1/cards")
        request.responseDecodable(of: Cards.self) { [unowned self] data in
            guard let cardsData = data.value else {
                dispatchGroup.leave()
                return
            }
            self.cards = cardsData.cards
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) { [unowned self] in
            view?.updateCards(with: cards)
        }
    }
}
