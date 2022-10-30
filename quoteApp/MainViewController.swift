//
//  ViewController.swift
//  quoteApp
//
//  Created by Vasyl Larin on 28.10.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var categoriesTableView: UITableView!
    
    var quote: [Quote]!
    var userName: String! // проверка 
    
    let categories = Category.allValues
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = userName ?? "" // проверка
        

    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let categoryName = categories[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = categoryName.rawValue
        
        cell.contentConfiguration = content
  
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuotesVC") as? QuotesTableViewController else { return }
        let categoryName = categories[indexPath.row]
        vc.quote = quote
        vc.categoryName = categoryName.rawValue
        present(vc, animated: true)
    }
    
    
}

