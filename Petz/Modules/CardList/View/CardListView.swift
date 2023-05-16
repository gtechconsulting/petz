//
//  CardList.swift
//  Petz
//
//  Created by Camilo Oscar Girardelli Baptista on 15/05/23.
//

import UIKit

class CardListView: UIViewController,CardListViewProtocol {
    
    @IBOutlet var cardTblView: UITableView!
    @IBOutlet weak var searchTxt: UILabel!
    
    var presenter:CardListPresenterProtocol?
    var cardList = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CardListWireframe.createCardListModule(cardListRef: self)
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showCards(with cards: [Card]) {
        searchTxt.isHidden = true
        cardList = cards
        cardTblView.reloadData()
    }

}

extension CardListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cardTblView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath)
        let card = cardList[indexPath.row]
        cell.textLabel?.text = card.name
        cell.detailTextLabel?.text = card.type
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showCardSelection(with: cardList[indexPath.row], from: self)
    }
    
}

