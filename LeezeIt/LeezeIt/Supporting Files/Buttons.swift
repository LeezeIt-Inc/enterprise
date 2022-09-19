//
//  Buttons.swift
//  LeezeIt
//
//  Created by Riffat Khan on 9/2/22.
//

import UIKit

class CreateButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setupButton()
    }
    
    func setupButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemMint
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)

    }
}
