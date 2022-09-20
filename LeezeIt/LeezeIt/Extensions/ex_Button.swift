//
//  ex_Button.swift
//  LeezeIt
//
//  Created by harris ali on 9/19/22.
//

import Foundation
import UIKit

extension UIButton {
    
    func primaryButtonStyle() {
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 100)
        frame.size = CGSize(width: 300, height: 100)
        backgroundColor = .systemMint
        titleLabel?.textColor = .red
    }
}
