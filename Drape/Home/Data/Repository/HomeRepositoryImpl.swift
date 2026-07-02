//
//  HomeRepository.swift
//  Drape
//
//  Created by Youssef Abd El-Fatah on 01/07/2026.
//

import Foundation

class HomeRepositoryImpl: HomeRepositoryProtocol {
    
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchProducts() async throws -> [Product] {
        
        let productDTOs = try await networkService.fetchProdcuts()
        return productDTOs.map { $0.convertToEntity() }
    }
}
