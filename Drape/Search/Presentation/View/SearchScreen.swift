//
//  SearchScreen.swift
//  Drape
//
//  Created by Moaz on 01/07/2026.
//

import SwiftUI

struct SearchScreen: View {
    var onBellTap: () -> Void = {}
    var body: some View {
        NavigationStack {
            VStack {
                CustomSearchField()
                    .padding(.vertical, 19)
//                RecentSearchSectionView(onClearAll: {})
            }
            .padding(.horizontal, 16)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: onBellTap){
                        Image(systemName: "bell")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(.black)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Search")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(.black)
                }
            }
        }
        
    }
}

#Preview {
    SearchScreen()
}
