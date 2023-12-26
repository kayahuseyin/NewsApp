//
//  Model.swift
//  NewsApp
//
//  Created by Hüseyin Kaya on 26.12.2023.
//

import Foundation

struct Model: Decodable  {
// Veri okumak(get) icin Decodable veri insert update delete gibi islemlerde Encodable kullanilir. Ikisini de kullanmak istiyorsak Codable.
    var title: String?
    var description: String?
    var urlToImage: String?
    
}

struct NewResponse: Decodable {
    var articles : [Model]
    
}
