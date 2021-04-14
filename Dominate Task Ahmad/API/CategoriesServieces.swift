//
//  CategoriesServieces.swift
//  Dominate Task Ahmad
//
//  Created by Ahmad Mustafa on 07/03/2021.
//

import Foundation

class CategoriesServieces{
    //MARK: - getBrands
    class func getCategories(onSuccess: @escaping (Categories?) -> Void , onFailed: @escaping (Error?) -> Void) -> Void{
        
        Network.sendGetRequest(requestURL: "http://www.talabyeh.com/Api/categories") {
            response in
            DispatchQueue.main.async {
                if let data = response?.data{
                    let catData = try? JSONDecoder().decode(Categories.self, from: data)
                    onSuccess(catData)
                }else{
                    onSuccess(nil)
                }
            }
        }
    }
}
