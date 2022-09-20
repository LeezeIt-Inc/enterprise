//
//  FinalClassButton.swift
//  LeezeIt
//
//  Created by harris ali on 9/19/22.
//

import Foundation
import UIKit

final class tryButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title:String){
        super.init(frame: .zero)
        backgroundColor = .red
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 21
        frame.size = CGSize(width: 350, height: 67)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }    
}
