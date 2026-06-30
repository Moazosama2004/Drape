//
//  KeychainTokenStorage.swift
//  Drape
//
//  Created by TaqieAllah on 30/06/2026.
//

import Foundation
final class KeychainTokenStorage: TokenStorageProtocol {
    private let keychain = KeychainStorage()
    private let tokenKey = "firebase_id_token"
    
    
    func saveToken(_ token: String) {
        try? keychain.save(token, forKey: tokenKey)
    }
    
    func getToken() -> String? {
        keychain.read(forKey: tokenKey)
    }
    
    func clearToken() {
        try? keychain.delete(forKey: tokenKey)
    }
}
