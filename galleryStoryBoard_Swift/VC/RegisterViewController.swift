//
//  RegisterViewController.swift
//  galleryStoryBoard_Swift
//
//  Created by Ismael Reckziegel on 05/01/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var alert: AlertController?
    
    @IBOutlet weak var createAccountInformationLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var accountUseInformationLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailUserTexField: UITextField!
    @IBOutlet weak var securePasswordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsUIRegisterAccount()
        settingsTextFieldDelegate()
        
        alert = AlertController(controller: self)
        
    }
    
    @IBAction func tappedCreateAccountButton(_ sender: UIButton) {
        
        if validateTextFieldCreateAccount() {
            
            let view: TabBarViewController? = UIStoryboard(name: "TabBarViewController", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController
            
            self.navigationController?.setViewControllers([view ?? UIViewController()], animated: true)
            
        }
        
    }
    
    func settingsUIRegisterAccount() {
        
        createAccountInformationLabel.text = "Create an account"
        
        welcomeLabel.text = "Welcome"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        
        accountUseInformationLabel.text = "This is the information we will use to create your account."
        accountUseInformationLabel.numberOfLines = 2
        accountUseInformationLabel.lineBreakMode = .byWordWrapping
        
        firstNameTextField.placeholder = "First Name"
        firstNameTextField.autocapitalizationType = .words
        
        lastNameTextField.placeholder = "Last Name"
        lastNameTextField.autocapitalizationType = .words
        
        emailUserTexField.placeholder = "E-mail (use to login)"
        
        securePasswordLabel.text = "Create a secure password!"
        
        passwordTextField.placeholder = "Your password"
        passwordTextField.isSecureTextEntry = true
        
        confirmPasswordTextField.placeholder = "Confirm your password"
        confirmPasswordTextField.isSecureTextEntry = true
        
        createAccountButton.setTitle("Create an account", for: .normal)
        createAccountButton.tintColor = UIColor.black
        createAccountButton.backgroundColor = UIColor.systemGray5
        createAccountButton.layer.cornerRadius = 4
        
        logoImageView.image = UIImage(systemName: "swift")
        logoImageView.tintColor = UIColor.black
        
        createAccountButton.isEnabled = false
        
    }
    
    func settingsTextFieldDelegate() {
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailUserTexField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
    }
    
    func validateTextFieldCreateAccount() -> Bool {
    
        if firstNameTextField.text != "" && lastNameTextField.text != "" && emailUserTexField.text != "" && passwordTextField.text != "" && confirmPasswordTextField.text != "" {
            
            if emailUserTexField.text?.contains("@") ?? false {
                
                if passwordTextField.text == confirmPasswordTextField.text {

                    createAccountButton.isEnabled = true

                    return true
                    
                } else {

                    alert?.alertInformation(title: "Error", message: "Passwords do not match!")
                    createAccountButton.isEnabled = false
                    
                    return false
                    
                }
                
            } else {

                alert?.alertInformation(title: "Error", message: "Please include a valid e-mail!")
                createAccountButton.isEnabled = false
                
                return false
                
            }
            
        } else {

            createAccountButton.isEnabled = false
            
            return false
            
        }
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    
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
        
        let _ = validateTextFieldCreateAccount()
        
        textField.layer.borderWidth = 0
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == firstNameTextField {
            
            lastNameTextField.becomeFirstResponder()
            
        } else if textField == lastNameTextField {
            
            emailUserTexField.becomeFirstResponder()
            
        } else if textField == emailUserTexField {
            
            passwordTextField.becomeFirstResponder()
            
        } else if textField == passwordTextField {
            
            confirmPasswordTextField.becomeFirstResponder()
            
        } else {
            
            textField.resignFirstResponder()
            
        }
        
        return true
    }
    
}
