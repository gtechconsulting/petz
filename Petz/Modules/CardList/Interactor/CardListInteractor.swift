//
//  CardListInteractor.swift
//  Petz
//
//  Created by Camilo Oscar Girardelli Baptista on 15/05/23.
//

import UIKit

class CardListInteractor: CardListInputInteractorProtocol {
    
    weak var presenter: CardListOutputInteractorProtocol?
    
    var cardList = [Card]()
    
    func getAllCardDetail() {
        
        let cardTypeHeroURL = WebServiceAPIPaths.cardTypeAPIPath + "Hero"
        
        WebServiceManager.sharedService.requestAPI(url: cardTypeHeroURL, parameter: nil, httpMethodType: .GET) { (response, error) in
          DispatchQueue.main.async {
            guard let data = response else {
              self.presenter?.showErrorMessage(errorMessage: error?.localizedDescription)
              return
            }
            let allCardDetail = data
            if allCardDetail.count > 0 {
                let decoder = JSONDecoder()
                for item in allCardDetail {
                    print(item)
                    var card = Card()
                    card.name = item["name"] as? String
                    card.img = item["img"] as? String
                    card.cardSet = item["cardSet"] as? String
                    card.faction = item["faction"] as? String
                    card.type = item["type"] as? String
                    card.health = item["health"] as? String
                    card.rarity = item["rarity"] as? String
                    card.text = item["text"] as? String
                    card.armor = item["armor"] as? String
                    
                    print(card)
                    self.cardList.append(card)
                }
                self.presenter?.cardListDidFetch(cardList: self.cardList)
            } else {
              self.presenter?.showErrorMessage(errorMessage: "No cards found")
            }
            
          }
        }
    }
}
