//
//  GreetingViewController.swift
//  quoteApp
//
//  Created by Байсаев Зубайр on 29.10.2022.
//

import UIKit

class GreetingViewController: UIViewController {

    var quote: [Quote]!
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = userName ?? "" // проверка

    }
    

    

}
