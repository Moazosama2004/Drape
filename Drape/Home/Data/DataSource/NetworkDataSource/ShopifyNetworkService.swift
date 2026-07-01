//
//  ShopifyNetworkService.swift
//  Drape
//
//  Created by Youssef Abd El-Fatah on 01/07/2026.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func fetchProducts(completion: @escaping (Result<[ProductDTO],AFError>) -> Void)
}

class ShopifyNetworkService: NetworkServiceProtocol {
    
    let url = "https://\(APISecrets.ShopName)/admin/api/2026-01/products.json?limit=50"
    
    // 1. Define your headers using Alamofire's HTTPHeaders type
    let headers: HTTPHeaders = [
        "X-Shopify-Access-Token": APISecrets.adminApiKey,
        "Content-Type": "application/json"
    ]
    
    func fetchProducts(completion: @escaping (Result<[ProductDTO],AFError>) -> Void) {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        AF.request(url, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: [ProductDTO].self, decoder: decoder) { response in
                switch response.result {
                case .success(let products):
                    completion(.success(products))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
