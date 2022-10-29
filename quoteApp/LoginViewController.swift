//
//  LoginViewController.swift
//  quoteApp
//
//  Created by Дарина Самохина on 29.10.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.getUser()
    private let quote = Quote.getQuote()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.text = user.login
        passwordTextField.text = user.password
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBarController = segue.destination as? UITabBarController else {
            return
        }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let navigationVC = $0 as? UINavigationController {
                let greetingVC = navigationVC.topViewController
                guard let greetingVC = greetingVC as? GreetingViewController else { return }
                greetingVC.quote = quote
                greetingVC.userName = user.login // проверка 
            } else if let navigationVC = $0 as? UINavigationController {
                let mainVC = navigationVC.topViewController
                guard let mainVC = mainVC as? MainViewController else { return }
                mainVC.quote = quote
                mainVC.userName = user.login // проверка
            }
        }
    }
    
    @IBAction func logInButtonDidPressed() {
        guard userNameTextField.text == user.login && passwordTextField.text == user.password else {
            showAlert(
                withTitle: "Неправильный логин или пароль",
                andMessage: "Пожалуйста, введите корректные данные.",
                textField: passwordTextField
            )
            return
        }
        performSegue(withIdentifier: "GoToGreetingVC", sender: nil)
    }

    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTitle: "Ауч!", andMessage: "Ваш логин \(user.login)")
        : showAlert(withTitle: "Ауч-ауч!", andMessage: "Ваш пароль \(user.password)")
    }
}

//MARK: - UIAlertController
extension UIViewController {
    func showAlert(
        withTitle title: String, andMessage message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Понятно", style: .default) { _ in
            textField?.text = ""
        }
        present(alert, animated: true)
        alert.addAction(okAction)
    }
}
