//
//  CreateAccountViewController.swift
//  LeezeIt
//
//  Created by Riffat Khan on 9/6/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
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
    //TODO: [make Button resuseable].
    
    @IBAction func nextButtonAction() {
        showAlertOfMissingTextInTextField()
    }
}

// MARK:    Extension SignUPViewController

extension SignUpViewController {
    
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
}
