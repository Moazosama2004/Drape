//
//  SearchListView.swift
//  Drape
//
//  Created by Moaz on 01/07/2026.
//

import SwiftUI

struct TempSearchProduct: Identifiable {
    var id: Int
    let title: String
    let price: String
    let discount: String?   
    let imageURL: String
}

struct SearchListView: View {
    let results: [TempSearchProduct]

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(results) { product in
                    SearchItemView(
                        title: product.title,
                        price: product.price,
                        discount: product.discount,
                        imageURL: product.imageURL,
                        onTap: {}
                    )

                    Divider()
                        .padding(.horizontal, 16)
                }
            }
        }
    }
}

#Preview {
    SearchListView(results: [
        TempSearchProduct(id: 1, title: "Regular Fit Slogan", price: "$ 1,190", discount: nil, imageURL: "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500"),
        TempSearchProduct(id: 2, title: "Regular Fit Polo", price: "$ 1,100", discount: "-52%", imageURL: "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500"),
        TempSearchProduct(id: 3, title: "Regular Fit Black", price: "$ 1,690", discount: nil, imageURL: "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500"),
        TempSearchProduct(id: 4, title: "Regular Fit V-Neck", price: "$ 1,290", discount: nil, imageURL: "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500")
    ])
}
