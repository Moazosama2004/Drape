//
//  RecentSearchSectionView.swift
//  Drape
//
//  Created by Moaz on 01/07/2026.
//

import SwiftUI

struct RecentSearchSectionView: View {
    var onClearAll: () -> Void
    var body: some View {
        RecentSearchHeaderView(onClearAll: onClearAll)
            .padding(.bottom, 20.0)
        RecentSearchListView()
    }
}

#Preview {
    RecentSearchSectionView(onClearAll: {})
}
