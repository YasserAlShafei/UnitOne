//
//  ViewModel.swift
//  UnitOne Task
//
//  Created by Yasser Al-ShaFei on 24/03/2022.
//

import Foundation


class ViewModel: Decodable {
    let id: Int
    let name: String
    let imageURL: String
    
    enum CodeingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case imageURL = "imageURL"
    }
}


