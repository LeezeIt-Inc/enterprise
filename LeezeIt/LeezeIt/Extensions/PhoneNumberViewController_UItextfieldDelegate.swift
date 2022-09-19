//
//  PhoneNumberViewController_UItextfieldDelegate.swift
//  LeezeIt
//
//  Created by harris ali on 9/18/22.
//


import UIKit

extension PhoneNumberViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "+X (XXX) XXX-XXXX", phone: newString)
        dismissKeyBoard()
        return false
    }
}
