//
//  CustomeLabel.swift
//  Dominate Task Ahmad
//
//  Created by Ahmad Mustafa on 07/03/2021.
//

import UIKit

class CustomeLabel: UILabel{
    init(titleText: String) {
        super.init(frame: .zero)
        text = titleText
        textColor = .white
        font = UIFont.boldSystemFont(ofSize: 22)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
