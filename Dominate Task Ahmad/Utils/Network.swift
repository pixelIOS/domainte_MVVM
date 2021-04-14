//
//  Network.swift
//  masar
//
//  Created by Ahmad Mustafa on 2/17/20.
//  Copyright © 2020 appzzon. All rights reserved.
//

import UIKit
import Alamofire

class Network: NSObject{
    class func sendGetRequest(requestURL:String,result:@escaping (AFDataResponse<Any>?) -> Void) {
        AF.request(requestURL,method: .get ,parameters: nil,headers: nil)
            .responseJSON
            { response in
                print("\n\n================================================")
                print("\n\nURL ==> \(String(describing: (response.request?.url ?? URL(string: ""))))")
                print("\n\nHeaders ==> \(response.request?.allHTTPHeaderFields ?? [:])")
//                print("\n\nParameters ==> \(parametersDict ?? [:])")
                print("\n\nResponse ==> \(response.data?.prettyPrintedJSONString ?? "")")
                result(response)
        }
    }
}

extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}
