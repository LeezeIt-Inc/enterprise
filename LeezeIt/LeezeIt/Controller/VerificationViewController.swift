//
//  VerificationViewController.swift
//  LeezeIt
//
//  Created by harris ali on 9/1/22.
//

import UIKit

class VerificationViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    @IBOutlet weak var textFieldThree: UITextField!
    @IBOutlet weak var textFieldFour: UITextField!
    @IBOutlet weak var verifyButtonOutlet: UIButton! {
        didSet {
            verifyButtonOutlet.layer.cornerRadius = 12
        }
    }
    //TODO: [make Button resuseable].
    @IBAction func verifyButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textFieldOne.becomeFirstResponder()
    }
    
    @objc func textDidChange(textField:UITextField) {
        let text = textField.text
        if text?.utf16.count == 1 {
            
            switch textField {
            case textFieldOne :
                textFieldTwo.becomeFirstResponder()
                break
            case textFieldTwo :
                textFieldThree.becomeFirstResponder()
                break
            case textFieldThree :
                textFieldFour.becomeFirstResponder()
                break
            case textFieldFour :
                textFieldFour.resignFirstResponder()
                break
            default :
                break
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setup() {
        textFieldOne.addTarget(self, action: #selector(textDidChange(textField:)), for: UIControl.Event.editingChanged)
        textFieldTwo.addTarget(self, action: #selector(textDidChange(textField:)), for: UIControl.Event.editingChanged)
        textFieldThree.addTarget(self, action: #selector(textDidChange(textField:)), for: UIControl.Event.editingChanged)
        textFieldFour.addTarget(self, action: #selector(textDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
}
