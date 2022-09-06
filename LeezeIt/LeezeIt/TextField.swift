//
//  TextField.swift
//  LeezeIt
//
//  Created by Riffat Khan on 9/6/22.
//

import Foundation
import UIKit

// adding max lenght attribute on interface builder
private var __maxLengths = [UITextField: Int]()

extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
               return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        if let text:String = textField.text {
        textField.text = String(text.prefix(maxLength))
    }
}
}
