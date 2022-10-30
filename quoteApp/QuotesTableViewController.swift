//
//  QuotesViewController.swift
//  quoteApp
//
//  Created by Байсаев Зубайр on 29.10.2022.
//

import UIKit

class QuotesTableViewController: UITableViewController {

//    let quotes = Quote.getQuote()
    var quote: [Quote]!
    var quotes = Quote.getQuote()
    var categoryName = " "
    var newQuotes = [Quote]()
    var familiyQuotes: [Quote] = []
    var moneyQuotes: [Quote] = []
    var friendshipyQuotes: [Quote] = []
    var lifeQuotes: [Quote] = []

   
    override func viewDidLoad() {
        super.viewDidLoad()
        sortQuotes()
        chooseTheRightCategory()
    }
    
    
    func sortQuotes() -> [Quote] {
        for quote in quotes {
            switch quote.category {
            case .money:
                moneyQuotes.append(quote)
            case .friendship:
                friendshipyQuotes.append(quote)
            case .life:
                lifeQuotes.append(quote)
            case .family:
                familiyQuotes.append(quote)
            }
        }
        return newQuotes
    }
    
    func chooseTheRightCategory() {
        switch categoryName {
        case "дружба":
            newQuotes = friendshipyQuotes
        case "семья":
            newQuotes = familiyQuotes
        case "деньги":
            newQuotes = moneyQuotes
        default:
            newQuotes = lifeQuotes
        }
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newQuotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quoteText = newQuotes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = quoteText.text
        cell.contentConfiguration = content
        return cell
    }
}
