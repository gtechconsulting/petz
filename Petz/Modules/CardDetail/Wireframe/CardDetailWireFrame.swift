//
//  CardDetailWireFrame.swift
//  Petz
//
//  Created by Camilo Oscar Girardelli Baptista on 15/05/23.
//

import UIKit

class CardDetailWireFrame: CardDetailWireFrameProtocol {
    
    class func createCardDetailModule(with cardDetailRef: CardDetailView, and card: Card) {
        let presenter = CardDetailPresenter()
        presenter.card = card
        cardDetailRef.presenter = presenter
        cardDetailRef.presenter?.view = cardDetailRef
        cardDetailRef.presenter?.wireframe = CardDetailWireFrame()
    }
    
    func goBackToCardListView(from view: UIViewController) {
        
    }
    
    deinit {
        print("CardDetailWireFrame removed")
    }

}
