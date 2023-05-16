//
//  CardDetailPresenter.swift
//  Petz
//
//  Created by Camilo Oscar Girardelli Baptista on 15/05/23.
//

import UIKit

class CardDetailPresenter: CardDetailPresenterProtocol {
    
    weak var view: CardDetailViewProtocol?
    var wireframe: CardDetailWireFrameProtocol?
    var card: Card?
    
    func viewDidLoad() {
        view?.showCardDetail(with: card!)
    }
    
    func backButtonPressed(from view: UIViewController) {
        
    }
    
    deinit {
        print("CardDetailPresenter removed")
    }
    
}
