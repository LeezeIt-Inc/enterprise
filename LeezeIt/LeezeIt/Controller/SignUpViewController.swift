//
//  CreateAccountViewController.swift
//  LeezeIt
//
//  Created by Riffat Khan on 9/6/22.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedView()
        modifyButton()
        enableNextButton()
    }
    
    @IBAction func nextButtonAction() {
        showAlertOfMissingTextInTextField()
    }
}

extension SignUpViewController {
    
    func hideKeyboardWhenTappedView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func checkEmailFormat(email: String) -> Bool {
        let emailEntries = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailFormat = NSPredicate(format: "SELF MATCHES %@", emailEntries)
        return emailFormat.evaluate(with: email)
    }
    
    //        restrict user to enter numbers in name textFields
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == firstNameTextField || textField == lastNameTextField {
            return checkTextField(string: string)
        }
        return true
    }
    
    func checkTextField(string: String) -> Bool {
        let allowedCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
        return alphabet
    }
    
    func alertForMissingText(messageAlert: String) {
        let alert = UIAlertController(title: "Something missing!", message: messageAlert, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        self.present(alert, animated: true,completion: nil)
    }
    
    func showAlertOfMissingTextInTextField() {
        if firstNameTextField.text == "" {
            alertForMissingText(messageAlert: "Please write your first Name")
        } else if lastNameTextField.text == "" {
            alertForMissingText(messageAlert: "Please write your Last Name")
        }
    }
    
    func modifyButton() {
        nextButton.layer.cornerRadius = 10
    }
    
    func enableNextButton() {
        [passwordTextField, emailTextField].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        
        let validEmail = checkEmailFormat(email: emailTextField.text!)
        if validEmail == true && passwordTextField.text!.count > 6 {
            nextButton.isEnabled = true
        }
    }
}
