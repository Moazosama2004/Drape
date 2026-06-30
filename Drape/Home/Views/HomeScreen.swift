//
//  HomeScreen.swift
//  Drape
//
//  Created by Moaz on 27/06/2026.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack {
            VStack {
                HeaderHomeScreenView(onBellTap: {})
                    .padding(.horizontal, 16.0)
                    .padding(.top, 12.0)
                    .padding(.bottom, 16.0)

                HStack(spacing: 8) {
                    CustomSearchField()
                    SliderFilterView(onTap: {})
                }
                .padding(.horizontal, 16.0)
                .padding(.bottom, 16.0)

                CategoryChipListView()
                    .padding(.leading, 16.0)
                    .padding(.bottom, 24.0)
            }
                    
            ScrollView {
                HomeProductsGridView(
                    products: [
                        TempProduct(id: 1, title: "Regular Fit Slogan", price: "$ 1,190", imageURL: "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500"),
                        TempProduct(id: 2, title: "Oversized Hoodie", price: "$ 2,450", imageURL: "https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500"),
                        TempProduct(id: 3, title: "Classic Denim", price: "$ 3,200", imageURL: "https://images.unsplash.com/photo-1542272604-787c3835535d?w=500"),
                        TempProduct(id: 4, title: "Smart Chinos", price: "$ 1,890", imageURL: "https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=500"),
                        TempProduct(id: 5, title: "Regular Fit Slogan", price: "$ 1,190", imageURL: "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500"),
                        TempProduct(id: 6, title: "Oversized Hoodie", price: "$ 2,450", imageURL: "https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500"),
                        TempProduct(id: 7, title: "Classic Denim", price: "$ 3,200", imageURL: "https://images.unsplash.com/photo-1542272604-787c3835535d?w=500"),
                        TempProduct(id: 8, title: "Smart Chinos", price: "$ 1,890", imageURL: "https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=500")
                    ]
                )
            }
        }
    }
}




#Preview {
    HomeScreen()
}
