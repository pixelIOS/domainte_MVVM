//
//  SearchViewController.swift
//  Dominate Task Ahmad
//
//  Created by Ahmad Mustafa on 07/03/2021.
//

import UIKit

class SearchViewController: UIViewController {

    let controllerLabel = CustomeLabel(titleText: "Search Controller")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        view.backgroundColor = .brown
        
        view.addSubview(controllerLabel)
        controllerLabel.center(inView: view)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
