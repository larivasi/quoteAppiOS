//
//  QuotesViewController.swift
//  quoteApp
//
//  Created by Байсаев Зубайр on 29.10.2022.
//

import UIKit

class QuotesTableViewController: UITableViewController {

//    let quotes = Quote.getQuote()
    var quotes = Quote.getQuote()
    var categoryName = " "
    var newQuotes = [Quote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortQuotes()
        // Do any additional setup after loading the view.
    }
    
    func sortQuotes() -> [Quote] {
        for quote in quotes {
//            switch quote.category {
//            case.family:
//                newQuotes.append(quote)
//            case .friendship:
//                newQuotes.append(quote)
//            case .money:
//                newQuotes.append(quote)
//            case .life:
//                newQuotes.append(quote)
//            }
            if quote.category == .friendship {
                newQuotes.append(quote)
            }
        }
        return newQuotes
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
