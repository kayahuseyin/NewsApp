//
//  WebServices.swift
//  NewsApp
//
//  Created by Hüseyin Kaya on 26.12.2023.
//

import Foundation

class WebServices {
    static let shared = WebServices()
    
    private init() {} 
    
    func fetchNews(completion: @escaping ([Model]?) -> Void) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=0bd0e59f026d405f83e51d32fc66093d"
        
        if let url = URL(string: urlString) { // url'yi alabiliyorsam islemleri yapacagiz
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    print(error?.localizedDescription ?? "No error") // Alert controller eklenecek
                } else {
                    do {
                        let result = try JSONDecoder().decode(NewResponse.self, from: data!)
                        completion(result.articles)
                    } catch {
                        print(error.localizedDescription) // Alert controller eklenecek
                    }
                }
                
            } .resume() // URLSession'un bitimine
            
        }
    }
}
