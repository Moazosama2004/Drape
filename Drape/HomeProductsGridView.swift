//
//  HomeListView.swift
//  Drape
//
//  Created by Youssef Abd El-Fatah on 27/06/2026.
//

import SwiftUI

// Temprary product model
struct TempProduct: Identifiable {
    var id: Int
    
    
    let title: String
    let price: String
    let imageURL: String
}

struct HomeProductsGridView: View {
    
    let products: [TempProduct]
     
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(products) { product in
                HomeProductCard(title: product.title, price: product.price, imageUrl: product.imageURL, onFavTap: {}, onCardTap: {})
            }
        }
        .padding()
    }
}

#Preview {
    HomeProductsGridView(
        products: [
            TempProduct(id: 1, title: "Regular Fit Slogan", price: "$ 1,190", imageURL: "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500"),
            TempProduct(id: 2, title: "Oversized Hoodie", price: "$ 2,450", imageURL: "https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500"),
            TempProduct(id: 3, title: "Classic Denim", price: "$ 3,200", imageURL: "https://images.unsplash.com/photo-1542272604-787c3835535d?w=500"),
            TempProduct(id: 4, title: "Smart Chinos", price: "$ 1,890", imageURL: "https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=500")
        ]
    )
}
