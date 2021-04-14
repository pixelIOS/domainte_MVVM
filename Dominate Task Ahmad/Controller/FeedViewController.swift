//
//  FeedViewController.swift
//  Dominate Task Ahmad
//
//  Created by Ahmad Mustafa on 07/03/2021.
//

import UIKit

class FeedViewController: UIViewController {

    let controllerLabel = CustomeLabel(titleText: "Feed Controller")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.backgroundColor = .systemGreen
        
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
