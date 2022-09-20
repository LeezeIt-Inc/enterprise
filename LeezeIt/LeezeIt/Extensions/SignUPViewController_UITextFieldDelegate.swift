//
//  SignUPViewController_UITextFieldDelegate.swift
//  LeezeIt
//
//  Created by harris ali on 9/18/22.
//

import Foundation
import UIKit

extension SignUpViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       if textField == firstNameTextField || textField == lastNameTextField {
           return checkTextField(string: string)
       }
       return true
   }
    
    @objc func editingChanged(_ textField: UITextField) {
        
        let validEmail = checkEmailFormat(email: emailTextField.text!)
        if validEmail == true && passwordTextField.text!.count > 6 {
            nextButton.isEnabled = true
        }
    }
}
