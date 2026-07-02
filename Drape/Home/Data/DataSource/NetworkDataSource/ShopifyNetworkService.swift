//
//  ShopifyNetworkService.swift
//  Drape
//
//  Created by Youssef Abd El-Fatah on 01/07/2026.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchProdcut() async throws -> [ProductDTO]
}

class ShopifyNetworkService: NetworkServiceProtocol {
    
    func fetchProdcut() async throws -> [ProductDTO] {
        let response: ProductResponse = try await ShopifyNetworkManager.fetch(endpoint: "products.json")
        return response.products
    }
    
}
