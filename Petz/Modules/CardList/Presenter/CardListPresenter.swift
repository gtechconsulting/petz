//
//  CardListPresenter.swift
//  Petz
//
//  Created by Camilo Oscar Girardelli Baptista on 15/05/23.
//

import UIKit

class CardListPresenter: CardListPresenterProtocol {
    
    var wireframe: CardListWireFrameProtocol?
    weak var view: CardListViewProtocol?
    var interactor: CardListInputInteractorProtocol?
    
    func showCardSelection(with card: Card, from view: UIViewController) {
        wireframe?.pushToCardDetail(with: card, from: view)
    }
    
    func viewDidLoad() {
        self.loadCardList()
    }

    func loadCardList() {
        interactor?.getAllCardDetail()
    }
    
    func showErrorMessage(errorMessage: String?) {
        if errorMessage != nil {
          Alert().showAlert(withMessage: "There is a problem to get cards. Please try again.", title: "Error")
        }
    }
    
}

extension CardListPresenter: CardListOutputInteractorProtocol {
    
    func cardListDidFetch(cardList: [Card]) {
        view?.showCards(with: cardList)
    }
    
}
