//
//  CardDetailView.swift
//  Petz
//
//  Created by Camilo Oscar Girardelli Baptista on 15/05/23.
//

import UIKit

class CardDetailView: UIViewController,CardDetailViewProtocol {

    @IBOutlet var cardImage: UIImageView!
    @IBOutlet var cardNameLbl: UILabel!
    @IBOutlet weak var cardFactionLbl: UILabel!
    @IBOutlet weak var cardSetLbl: UILabel!
    @IBOutlet weak var cardTypeLbl: UILabel!
    @IBOutlet weak var cardHealthLbl: UILabel!
    @IBOutlet weak var cardRarityLbl: UILabel!
    @IBOutlet weak var cardArmorLbl: UILabel!
    @IBOutlet weak var cardText: UITextView!
    
    let noInfo: String = " ---- "
    
    
    var presenter: CardDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showCardDetail(with card: Card) {
        title = card.name
        
        if card.img != nil {
            downloadImage(from: URL(string: card.img!)!)
        } else {
            cardImage.image = UIImage(named: "noImageAvailable")
        }
    
        cardNameLbl.text = "Name: \(card.name ?? noInfo)"
        cardFactionLbl.text = "Faction: \(card.faction ?? noInfo)"
        cardSetLbl.text = "Card set: \(card.cardSet ?? noInfo)"
        cardTypeLbl.text = "Type: \(card.type ?? noInfo)"
        cardHealthLbl.text = "Health: \(card.health ?? noInfo)"
        cardRarityLbl.text = "Rarity: \(card.rarity ?? noInfo)"
        cardArmorLbl.text = "Armor: \(card.armor ?? noInfo)"
        if card.text != nil {
            cardText.attributedText = card.text?.htmlToAttributedString
        } else {
            cardText.text = "Text: \(noInfo)"
        }
        
        
    }
    
    deinit {
        print("CardDetailView removed")
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.cardImage.image = UIImage(data: data)
            }
        }
    }

}
