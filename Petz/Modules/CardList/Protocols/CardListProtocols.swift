//
//  CardListProtocols.swift
//  Petz
//
//  Created by Camilo Oscar Girardelli Baptista on 15/05/23.
//

import UIKit


protocol CardListViewProtocol: class {
    // PRESENTER -> VIEW
    func showCards(with cards: [Card])
}

protocol CardListPresenterProtocol: class {
    //View -> Presenter
    var interactor: CardListInputInteractorProtocol? {get set}
    var view: CardListViewProtocol? {get set}
    var wireframe: CardListWireFrameProtocol? {get set}

    func viewDidLoad()
    func showCardSelection(with card: Card, from view: UIViewController)
    
}

protocol CardListInputInteractorProtocol: class {
    var presenter: CardListOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func getAllCardDetail()
}

protocol CardListOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func cardListDidFetch(cardList: [Card])
    func showErrorMessage(errorMessage: String?)
}

protocol CardListWireFrameProtocol: class {
    //Presenter -> Wireframe
    func pushToCardDetail(with card: Card,from view: UIViewController)
    static func createCardListModule(cardListRef: CardListView)
}
