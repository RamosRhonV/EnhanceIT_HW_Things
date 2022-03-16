//
//  ViewController.swift
//  Mar15_AllAboutTests
//
//  Created by Consultant on 3/15/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    
    private let secondVC = "secondVC"
    private let validation: ValidationService!
    private let dummyUser  = [User(username: "Admin", password: "Password")]
    
    init(validation: ValidationService) {
        self.validation = validation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.validation = ValidationService()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        PasswordTextField.isSecureTextEntry = true
    }

    @IBAction func loginTapped(_ sender: Any) {
        
        do {
            let username = try validation.validateUsername(UsernameTextField.text)
            let password = try validation.validatePassword(PasswordTextField.text)
            
            if UsernameTextField.text == username && PasswordTextField.text == password {
                navigateNext()
            }
        } catch {
            print(error)
        }
    }
    
    private func navigateNext() {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: secondVC) as! SecondViewController
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
}



