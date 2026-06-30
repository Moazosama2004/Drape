//
//  SignUpUseCase.swift
//  Drape
//
//  Created by TaqieAllah on 30/06/2026.
//

import Foundation
final class SignUpUseCase {
    private let authRepository: AuthRepositoryProtocol
    private let customerRepository: CustomerRepositoryProtocol
    
    init(authRepository: AuthRepositoryProtocol, customerRepository: CustomerRepositoryProtocol) {
        self.authRepository = authRepository
        self.customerRepository = customerRepository
    }
    
    func execute(fullName: String, email: String, password: String) async throws -> AppUser {
        _ = try await authRepository.signUp(email: email, password: password)
        return try await customerRepository.createShopifyCustomer(fullName: fullName, email: email)
    }
}
