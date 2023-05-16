//
//  CardDetailProtocols.swift
//  Petz
//
//  Created by Camilo Oscar Girardelli Baptista on 15/05/23.
//

import UIKit

protocol CardDetailPresenterProtocol: class {
    
    var wireframe: CardDetailWireFrameProtocol? {get set}
    var view: CardDetailViewProtocol? {get set}
    
    //View -> Presenter
    func viewDidLoad()
    func backButtonPressed(from view: UIViewController)
    
}

protocol CardDetailViewProtocol: class {
    //Presenter -> View
    func showCardDetail(with card: Card)
}

protocol CardDetailWireFrameProtocol: class {
    func goBackToCardListView(from view: UIViewController)
}
