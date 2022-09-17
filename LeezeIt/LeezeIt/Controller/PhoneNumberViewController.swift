//
//  PhoneNumberViewController.swift
//  LeezeIt
//
//  Created by harris ali on 8/29/22.
//
import Foundation
import UIKit

class PhoneNumberViewController:UIViewController{
    
    @IBOutlet weak var phoneNumberText: UITextField! {
        didSet {
            phoneNumberText.layer.cornerRadius = 12
            phoneNumberText.layer.borderWidth = 0.3
            phoneNumberText.keyboardType = UIKeyboardType.phonePad
            phoneNumberText.delegate = self
        }
    }
    
    @IBOutlet weak var leezeItlogo: UIImageView! {
        didSet {
            leezeItlogo.frame = CGRect(x: 48, y: 180, width: 338, height: 155)
            leezeItlogo.image = UIImage(named: "LeezeIt")
        }
    }
    
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 30
            nextButton.frame = CGRect(x: 40, y: 590, width: 345, height: 67)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUserDefaultData()
 }
    
    @IBAction func nextButton(_ sender: Any) {
        UserDefaults.standard.set(phoneNumberText.text!, forKey: "userPhoneNumber")
        let storyBoard = UIStoryboard(name:StoryBoardsID.VerificationViewController.rawValue, bundle: nil)
        
        let nextvc = storyBoard.instantiateViewController(withIdentifier: StoryBoardsID.VerificationViewController.rawValue) as! VerificationViewController
       present(nextvc, animated: true)
    }
    
    func fetchUserDefaultData () {
        let valueOfPhoneNumber = UserDefaults.standard.string(forKey: "userPhoneNumber")
        if valueOfPhoneNumber != nil {
            phoneNumberText.text = valueOfPhoneNumber
        }
    }
}

extension PhoneNumberViewController : UITextFieldDelegate {
    
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
  
    //Hides keyboard whenever user click/tap anywhere on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //hide keyboard after user entered 10 digits of phoneNumber
    func dismissKeyBoard() -> Bool {
        if let characterCount = phoneNumberText.text?.count {
            if characterCount >= 17 {
                return phoneNumberText.resignFirstResponder()
            }
        }
        return true
    }
    
}
