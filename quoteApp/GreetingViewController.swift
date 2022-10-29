//
//  GreetingViewController.swift
//  quoteApp
//
//  Created by Байсаев Зубайр on 29.10.2022.
//

import UIKit

class GreetingViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var quote: [Quote]!
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = userName ?? "" // проверка

    }
    

    

}
