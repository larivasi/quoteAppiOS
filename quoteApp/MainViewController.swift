//
//  ViewController.swift
//  quoteApp
//
//  Created by Vasyl Larin on 28.10.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var categoriesTableView: UITableView!
    
    let categories = Category.allValues
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let categoryName = categories[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = categoryName.rawValue
        
        cell.contentConfiguration = content
  
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuotesVC") as? QuotesViewController else { return }
      
        present(vc, animated: true)
    }
    
    
}

