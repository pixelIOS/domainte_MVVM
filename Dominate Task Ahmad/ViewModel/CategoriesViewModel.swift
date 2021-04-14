//
//  CategoriesViewModel.swift
//  Dominate Task Ahmad
//
//  Created by Ahmad Mustafa on 07/03/2021.
//

import UIKit

struct CategoriesViewModel{
    private let result: Result
    
    var logoURL: URL?{
        return URL(string: result.logo)
    }
    
    var titleLabel: String{
        return result.title
    }
    
    var logoColor: UIColor { return #colorLiteral(red: 0.3787218928, green: 0.3692588806, blue: 0.9188019633, alpha: 1)}
    
    init(result: Result) {
        self.result = result
    }
}
