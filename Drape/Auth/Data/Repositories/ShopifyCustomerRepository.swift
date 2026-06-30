//
//  ShopifyCustomerRepository.swift
//  Drape
//
//  Created by TaqieAllah on 30/06/2026.
//

import Foundation


final class ShopifyCustomerRepository: CustomerRepositoryProtocol {
    
    // TODO: put those later
    private let shopDomain = ""
    private let adminToken = ""
    private let apiVersion = ""
    
    func createShopifyCustomer(fullName: String, email: String) async throws -> AppUser {
        if let existing = try await findCustomer(byEmail: email) {
            return AppUser(
                id: "",
                email: existing.email,
                fullName: existing.first_name ?? fullName,
                shopifyCustomerID: String(existing.id),
                alreadyExisted: true
            )
        }
        return try await createCustomer(fullName: fullName, email: email)
    }
        
    // TODO: Use AF for later -- Ahmed Saiyd Good Luck ^^
    private func findCustomer(byEmail email: String) async throws -> ShopifyCustomerDTO? {
        var components = URLComponents(string: "https://\(shopDomain)/admin/api/\(apiVersion)/customers/search.json")!
        components.queryItems = [URLQueryItem(name: "query", value: "email:\(email)")]
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.setValue(adminToken, forHTTPHeaderField: "X-Shopify-Access-Token")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        try Self.validate(response, data: data)
        
        let result = try JSONDecoder().decode(ShopifySearchResponseDTO.self, from: data)
        return result.customers.first
    }
    
    
    private func createCustomer(fullName: String, email: String) async throws -> AppUser {
        let url = URL(string: "https://\(shopDomain)/admin/api/\(apiVersion)/customers.json")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(adminToken, forHTTPHeaderField: "X-Shopify-Access-Token")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ShopifyCreateCustomerRequestDTO(
            customer: .init(first_name: fullName, email: email, tags: "ios-app")
        )
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        try Self.validate(response, data: data)
        
        let result = try JSONDecoder().decode(ShopifyCreateResponseDTO.self, from: data)
        let customer = result.customer
        
        return AppUser(
            id: "",
            email: customer.email,
            fullName: customer.first_name ?? fullName,
            shopifyCustomerID: String(customer.id),
            alreadyExisted: false
        )
    }
    
    private static func validate(_ response: URLResponse, data: Data) throws {
        guard let http = response as? HTTPURLResponse, (200...299).contains(http.statusCode) else {
            let body = String(data: data, encoding: .utf8) ?? "unknown error"
            throw URLError(.badServerResponse, userInfo: [NSLocalizedDescriptionKey: body])
        }
    }
}


private struct ShopifySearchResponseDTO: Decodable {
    let customers: [ShopifyCustomerDTO]
}

private struct ShopifyCustomerDTO: Decodable {
    let id: Int
    let email: String
    let first_name: String?
}

private struct ShopifyCreateCustomerRequestDTO: Encodable {
    struct CustomerBody: Encodable {
        let first_name: String
        let email: String
        let tags: String
    }
    let customer: CustomerBody
}

private struct ShopifyCreateResponseDTO: Decodable {
    let customer: ShopifyCustomerDTO
}
