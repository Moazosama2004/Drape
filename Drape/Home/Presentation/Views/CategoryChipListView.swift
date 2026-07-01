//
//  CategoryChipList.swift
//  Drape
//
//  Created by Moaz on 29/06/2026.
//

import SwiftUI

struct CategoryChipListView: View {
    // will be replaced with real data later
    let categories = ["All", "Tshirts", "Jeans", "Shoes", "Accessories"]
    @State private var selectedCategory = "All"

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(categories, id: \.self) { category in
                    CategoryChipView(
                        title: category,
                        isSelected: selectedCategory == category,
                        onTap: { selectedCategory = category }
                    )
                }
            }

        }
    }
}

#Preview {
    CategoryChipListView()
}
