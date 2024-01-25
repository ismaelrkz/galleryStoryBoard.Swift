//
//  ViewController.swift
//  galleryStoryBoard_Swift
//
//  Created by Ismael Reckziegel on 05/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    var alert: AlertController?
    
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var firstInfoLabel: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var createByLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsTextFieldDelegate()
        settingsUILogin()
        
        alert = AlertController(controller: self)
        
    }
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        
        if validateTextFieldLogin() {
            
            let view: TabBarViewController? = UIStoryboard(name: "TabBarViewController", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController
            
            self.navigationController?.setViewControllers([view ?? UIViewController()], animated: true)
            
        }
        
    }
    
    @IBAction func tappedCreateAccountButton(_ sender: UIButton) {
        
        let view: RegisterViewController? = UIStoryboard(name: "RegisterViewController", bundle: nil).instantiateViewController(identifier: "RegisterViewController") as? RegisterViewController
        
        self.navigationController?.pushViewController(view ?? UIViewController(), animated: true)
        
    }
    
    func settingsUILogin() {
        
        logoImageView.image = UIImage(named: "tortoise")
        firstInfoLabel.text = "Create an account ou Sign in"
        userTextField.placeholder = "User (e-mail)"
        userTextField.keyboardType = .emailAddress
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        loginButton.tintColor = UIColor.black
        loginButton.backgroundColor = UIColor.systemGray5
        loginButton.layer.cornerRadius = 4
        loginButton.setTitle("Login", for: .normal)
        createAccountButton.setTitle("Create an account", for: .normal)
        createAccountButton.tintColor = UIColor.black
        createAccountButton.backgroundColor = UIColor.systemGray5
        createAccountButton.layer.cornerRadius = 4
        createByLabel.text = "by Ismael Reckziegel"
        
        loginButton.isEnabled = false
        
    }
    
    func settingsTextFieldDelegate() {
        
        userTextField.delegate = self
        passwordTextField.delegate = self
        
    }

    func validateTextFieldLogin() -> Bool {
        
        if userTextField.text != "" && passwordTextField.text != "" {
            
            if userTextField.text?.contains("@") ?? false {
                
                loginButton.isEnabled = true
                
                return true
                
            } else {
                
                self.alert?.alertInformation(title: "Error", message: "Please include a valid e-mail!")
                
                return false
                
            }
            
        } else {
            
            loginButton.isEnabled = false
            
            return false
            
        }
        
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 4
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let _ = validateTextFieldLogin()
            
            textField.layer.borderWidth = 0
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userTextField {
            
            passwordTextField.becomeFirstResponder()
            
        } else {
            
            textField.resignFirstResponder()
            
        }
        
        return true
    }
    
}

