//
//  Custom_Button.swift
//  LeezeIt
//
//  Created by harris ali on 9/19/22.
//

import Foundation
import UIKit

class SharedClass: NSObject {
    
    static let sharedInstance = SharedClass()
    
    func styleForComponents(button: UIButton) {
        button.layer.cornerRadius = 21
        button.frame.size = CGSize(width: 350, height: 60)
        button.backgroundColor = .systemMint
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    private override init() {
    }
}
