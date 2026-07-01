//
//  RecentSearchItemsListView.swift
//  Drape
//
//  Created by Moaz on 01/07/2026.
//

import SwiftUI

struct RecentSearchListView: View {
    let recentSearches = ["Jeans", "Casual clothes", "Hoodie", "Nike shoes black", "V-neck tshirt", "Winter clothes"]

    var body: some View {
        ScrollView {
            VStack () {
                ForEach(recentSearches , id: \.self) { item in
                    RecentSearchItemView(title: item) {
                        //handle delete
                    }
                    
                    Divider()
                        .foregroundStyle(Color(hex: "F0F0F0"))
                }
            }
        }
    }
}

#Preview {
    RecentSearchListView()
}
