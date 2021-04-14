//
//  HomeViewController.swift
//  Dominate Task Ahmad
//
//  Created by Ahmad Mustafa on 07/03/2021.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - Properties
    private let homeCellIdentifer = "HomeCell"
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "dominate")
        iv.contentMode = .scaleAspectFill
        iv.setDimensions(height: 55, width: 55)
        return iv
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = #colorLiteral(red: 0.9661965966, green: 0.9694837928, blue: 0.9766253829, alpha: 1)
        cv.showsVerticalScrollIndicator = false
        cv.register(HomeCell.self, forCellWithReuseIdentifier: homeCellIdentifer)
        return cv
    }()
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.text = "Choose your area"
        return label
    }()
    
    private var categories: Categories? = nil{
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    var selectedCellList = [IndexPath]()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchData()
    }
    
    //MARK: - Handlers
    private func configureUI(){
        title = "Home"
        view.backgroundColor = #colorLiteral(red: 0.9661965966, green: 0.9694837928, blue: 0.9766253829, alpha: 1)
        navigationItem.titleView = logoImageView
        view.addSubview(titleLable)
        titleLable.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 8, paddingLeft: 12)
        view.addSubview(collectionView)
        collectionView.anchor(top: titleLable.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 15, paddingRight: 20)
    }
    
    //MARK: - Action
    private func fetchData(){
        showLoader(true)
        CategoriesServieces.getCategories { (categories) in
            self.showLoader(false)
            guard let categories = categories else {return}
            self.categories = categories
        } onFailed: { (err) in
            self.showLoader(false)
            self.showMessage(withTitle: "Error", message: "\(err?.localizedDescription ?? "")")
        }

    }

}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let categories = categories else {return UICollectionViewCell()}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeCellIdentifer, for: indexPath) as! HomeCell
        cell.viewModel = CategoriesViewModel(result: categories.results[indexPath.row])
        
        if let _ = selectedCellList.firstIndex(of: indexPath) {
            cell.isCellCheck(isCheck: true)
        } else {
            cell.isCellCheck(isCheck: false)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let index = selectedCellList.firstIndex(of: indexPath) {
            selectedCellList.remove(at: index)
        } else {
            selectedCellList.append(indexPath)
        }
        
        collectionView.reloadData()
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 20) / 2.2
        return CGSize(width: width, height: width)
    }
}
