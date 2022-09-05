//
//  PhoneNumberViewController.swift
//  LeezeIt
//
//  Created by harris ali on 8/29/22.
//
import Foundation
import UIKit
class PhoneNumberViewController:UIViewController{
    
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var leezeItI: UIImageView!
    @IBOutlet weak var nextBut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBut.layer.cornerRadius = 30
        nextBut.frame = CGRect(x: 40, y: 590, width: 345, height: 67)
        phoneNumberText.layer.cornerRadius = 12
        phoneNumberText.layer.borderWidth = 0.3
        leezeItI.frame = CGRect(x: 48, y: 180, width: 338, height: 155)
        phoneNumberText.keyboardType = UIKeyboardType.phonePad
        phoneNumberText.delegate = self
}
  
    @IBAction func nextbutt(_ sender: Any) {
    }

}
extension PhoneNumberViewController : UITextFieldDelegate{

    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator
        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])
                // move numbers iterator to the next index
                index = numbers.index(after: index)
            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "+X (XXX) XXX-XXXX", phone: newString)
        dismissKeyBoard()
        return false
    }
    //MARK: -
    //Hides keyboard whenever user click/tap anywhere on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
    }
    //MARK: -
    //hide keyboard after user entered 10 digits of phoneNumber
    func dismissKeyBoard() -> Bool {
        if let characterCount = phoneNumberText.text?.count {
            // CHECK FOR CHARACTER COUNT IN TEXT FIELD
            if characterCount >= 17 {
                // RESIGN FIRST RERSPONDER TO HIDE KEYBOARD
                return phoneNumberText.resignFirstResponder()
            }
        }
        return true
    }
}
