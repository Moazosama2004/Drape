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
    @Published var brands: [Brand] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let getAllProductsUseCase: GetAllProductsUseCase
    private let getAllBrandsUseCase: GetAllBrandsUseCase
    
    init(
        getAllProductsUseCase: GetAllProductsUseCase,
        getAllBrandsUseCase: GetAllBrandsUseCase
    ) {
        self.getAllProductsUseCase = getAllProductsUseCase
        self.getAllBrandsUseCase = getAllBrandsUseCase
    }
    
    func loadHomeData() async {
     
        isLoading = true
        errorMessage = nil
        
        do {
            self.products = try await getAllProductsUseCase.execute()
            self.brands = try await getAllBrandsUseCase.execute()
            
            isLoading = false
        } catch {
            errorMessage = "Failed to load data \(error.localizedDescription)"
            isLoading = false
        }
    }
}
