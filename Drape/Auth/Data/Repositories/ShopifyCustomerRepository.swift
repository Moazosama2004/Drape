//
//  ShopifyCustomerRepository.swift
//  Drape
//
//  Created by TaqieAllah on 30/06/2026.

import Foundation

final class ShopifyCustomerRepository: CustomerRepositoryProtocol {
    
    private let shopDomain = " "
    private let adminToken = " "
    private let apiVersion = "2026-01"
    
    private let tokenStorage = KeychainTokenStorage()
    
    func createShopifyCustomer(fullName: String, email: String) async throws -> AppUser {
        if let existing = try await findCustomer(byEmail: email) {
            print("Customer already exists in Shopify")
            return AppUser(
                id: tokenStorage.getFirebaseUID() ?? "",
                email: existing.email,
                fullName: [existing.first_name, existing.last_name]
                    .compactMap { $0 }
                    .filter { !$0.isEmpty }
                    .joined(separator: " "),
                shopifyCustomerID: String(existing.id),
                alreadyExisted: true
            )
        }
        return try await createCustomer(fullName: fullName, email: email)
    }
        
    private func findCustomer(byEmail email: String) async throws -> ShopifyCustomerDTO? {
        guard var components = URLComponents(string: "https://\(shopDomain)/admin/api/\(apiVersion)/customers/search.json") else {
            throw URLError(.badURL)
        }
        components.queryItems = [URLQueryItem(name: "query", value: "email:\(email)")]
        guard let url = components.url else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(adminToken, forHTTPHeaderField: "X-Shopify-Access-Token")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print("Search response:\n\(prettyJSON(data))")
        try Self.validate(response, data: data)
        
        return try JSONDecoder().decode(ShopifySearchResponseDTO.self, from: data).customers.first
    }
        
    private func createCustomer(fullName: String, email: String) async throws -> AppUser {
        print("Entered....El")
        let parts = fullName.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
        let firstName = parts.first ?? fullName
        let lastName = parts.dropFirst().joined(separator: " ")
        
        let firebaseUID = tokenStorage.getFirebaseUID() ?? ""
        let tags = firebaseUID.isEmpty ? "ios-app" : "ios-app, firebase:\(firebaseUID)"
        
        print("Sending - name: '\(firstName) \(lastName)', email: '\(email)', firebaseUID: '\(firebaseUID)'")
        
        guard let url = URL(string: "https://\(shopDomain)/admin/api/\(apiVersion)/customers.json") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(adminToken, forHTTPHeaderField: "X-Shopify-Access-Token")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(
            ShopifyCreateCustomerRequestDTO(
                customer: .init(
                    first_name: firstName,
                    last_name: lastName,
                    email: email,
                    tags: tags
                )
            )
        )
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print("Create response:\n\(prettyJSON(data))")
        try Self.validate(response, data: data)
        
        let customer = try JSONDecoder().decode(ShopifyCreateResponseDTO.self, from: data).customer
        return AppUser(
            id: firebaseUID,        // ← from Keychain, not from use case
            email: customer.email,
            fullName: fullName,
            shopifyCustomerID: String(customer.id),
            alreadyExisted: false
        )
    }
        
    private static func validate(_ response: URLResponse, data: Data) throws {
        guard let http = response as? HTTPURLResponse,
              (200...299).contains(http.statusCode) else {
            let body = String(data: data, encoding: .utf8) ?? "Unknown error"
            throw URLError(.badServerResponse, userInfo: [NSLocalizedDescriptionKey: body])
        }
    }
        
    private func prettyJSON(_ data: Data) -> String {
        #if DEBUG
        guard let object = try? JSONSerialization.jsonObject(with: data),
              let prettyData = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .sortedKeys]),
              let string = String(data: prettyData, encoding: .utf8) else {
            return String(data: data, encoding: .utf8) ?? "Invalid JSON"
        }
        return string
        #else
        return ""
        #endif
    }
}


private struct ShopifySearchResponseDTO: Decodable {
    let customers: [ShopifyCustomerDTO]
}

private struct ShopifyCustomerDTO: Decodable {
    let id: Int
    let email: String
    let first_name: String?
    let last_name: String?
}

private struct ShopifyCreateCustomerRequestDTO: Encodable {
    struct CustomerBody: Encodable {
        let first_name: String
        let last_name: String
        let email: String
        let tags: String
    }
    let customer: CustomerBody
}

private struct ShopifyCreateResponseDTO: Decodable {
    let customer: ShopifyCustomerDTO
}
