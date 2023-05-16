//
//  CardListWireframe.swift
//  Petz
//
//  Created by Camilo Oscar Girardelli Baptista on 15/05/23.
//

import UIKit

class CardListWireframe: CardListWireFrameProtocol {
   
    func pushToCardDetail(with card: Card,from view: UIViewController) {
        let cardDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: "CardDetailView") as! CardDetailView
        CardDetailWireFrame.createCardDetailModule(with: cardDetailViewController, and: card)
        view.navigationController?.pushViewController(cardDetailViewController, animated: true)
    }
    
    class func createCardListModule(cardListRef: CardListView) {
       let presenter: CardListPresenterProtocol & CardListOutputInteractorProtocol = CardListPresenter()
        
        cardListRef.presenter = presenter
        cardListRef.presenter?.wireframe = CardListWireframe()
        cardListRef.presenter?.view = cardListRef
        cardListRef.presenter?.interactor = CardListInteractor()
        cardListRef.presenter?.interactor?.presenter = presenter
    }
    
}
