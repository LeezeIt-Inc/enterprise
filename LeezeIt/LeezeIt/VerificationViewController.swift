//
//  VerificationViewController.swift
//  LeezeIt
//
//  Created by harris ali on 9/1/22.
//

import UIKit

class VerificationViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var textOne: UITextField!
    @IBOutlet weak var textTwo: UITextField!
    @IBOutlet weak var textThree: UITextField!
    @IBOutlet weak var textFour: UITextField!
    @IBOutlet weak var vButt: UIButton!
    
    @IBAction func veriFyB(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vButt.layer.cornerRadius = 12
        textOne.addTarget(self, action: #selector(textDidChange(textField:)), for: UIControl.Event.editingChanged)
        textTwo.addTarget(self, action: #selector(textDidChange(textField:)), for: UIControl.Event.editingChanged)
        textThree.addTarget(self, action: #selector(textDidChange(textField:)), for: UIControl.Event.editingChanged)
        textFour.addTarget(self, action: #selector(textDidChange(textField:)), for: UIControl.Event.editingChanged)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textOne.becomeFirstResponder()
    }

    @objc func textDidChange(textField:UITextField){
        let text = textField.text
        if text?.utf16.count == 1 {
            
            switch textField {
            case textOne :
                textTwo.becomeFirstResponder()
                break
            case textTwo :
                textThree.becomeFirstResponder()
                break
            case textThree :
                textFour.becomeFirstResponder()
                break
            case textFour :
                textFour.resignFirstResponder()
                break
            default :
                break
            }
        }else {
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
       }
    

