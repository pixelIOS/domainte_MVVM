//
//  HomeCell.swift
//  Dominate Task Ahmad
//
//  Created by Ahmad Mustafa on 07/03/2021.
//

import UIKit
import SDWebImage

class HomeCell: UICollectionViewCell{
    
    //MARK: - Properties
    var viewModel: CategoriesViewModel? {
        didSet{
            configure()
        }
    }
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.setDimensions(height: 50, width: 50)
        return iv
    }()
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.systemGray
        return label
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        self.layer.cornerRadius = 12
        
        addSubview(logoImageView)
        logoImageView.center(inView: self)
        
        addSubview(titleLable)
        titleLable.centerX(inView: logoImageView)
        titleLable.anchor(top: logoImageView.bottomAnchor, paddingTop: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        guard let viewModel = viewModel else {return}
        logoImageView.sd_setImage(with: viewModel.logoURL)
        logoImageView.tintColor = viewModel.logoColor
        titleLable.text = viewModel.titleLabel
    }
    
    func isCellCheck(isCheck: Bool){
        if isCheck{
            backgroundColor = #colorLiteral(red: 0.3787218928, green: 0.3692588806, blue: 0.9188019633, alpha: 1)
            titleLable.textColor = .white
        }else {
            backgroundColor = .white
            titleLable.textColor = UIColor.systemGray
        }
    }
}

