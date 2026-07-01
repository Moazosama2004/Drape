//
//  File.swift
//  Drape
//
//  Created by Youssef Abd El-Fatah on 01/07/2026.
//

import Foundation

struct ProductResponse: Codable {
    let products: [ProductDTO]
}

struct ProductDTO: Codable {
    
    let id: Int
    let title: String
    let vendor: String // ex: Adidas
    let productType: String // ex: Shoes
    let variants: [VariantDTO] // gets the price
    let image: ImageDTO // gets the image link
}

struct VariantDTO: Codable {
    let price: String
}

struct ImageDTO: Codable {
    let src: String
}
