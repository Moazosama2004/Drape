//
//  HomeViewModel.swift
//  Drape
//
//  Created by Youssef Abd El-Fatah on 01/07/2026.
//

import Foundation

// Ensure all UI updates happen safely on the main thread
@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let getProductsUseCase: GetAllProductsUseCase
    
    init(getProductsUseCase: GetAllProductsUseCase) {
        self.getProductsUseCase = getProductsUseCase
    }
    
    func getProducts() async {
     
        isLoading = true
        errorMessage = nil
        
        do {
            self.products = try await getProductsUseCase.execute()
            isLoading = false
        } catch {
            errorMessage = "Failed to load products \(error.localizedDescription)"
            isLoading = false
        }
    }
}
