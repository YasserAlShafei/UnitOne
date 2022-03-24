//
//  APIRequest.swift
//  UnitOne Task
//
//  Created by Yasser Al-ShaFei on 24/03/2022.
//

import Foundation
import Alamofire


class Network {
    static let MAIN_URL :String = "http://ahmedqazzaz.com/unitone"
    static let SLIDER_URL :String = "\(MAIN_URL)/home"
    static let ALLCITIES_URL :String = "\(MAIN_URL)/home"
    
    
//    typealias WebServiceResponse = ([[String:Any]]?, Error) -> Void
//
//    func execute(_ url: URL, completion: @escaping WebServiceResponse){
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "PUT"
//        AF.request(urlRequest)
//
//        AF.request(url).validate().responseJSON { response in
//            if let error = response.error {
//                completion(nil, error)
//            }else if let jsonArray = response.result.value as? [[String:Any]] {
//                completion(jsonArray, nil)
//            }else if let jsonDict = response.result.value as? [String:Any] {
//                completion([jsonDict], nil)
//            }
//
//        }
//
//    }
}
