//
//  RecentSearchItem.swift
//  Drape
//
//  Created by Moaz on 01/07/2026.
//

import SwiftUI

struct RecentSearchItemView: View {
    let title: String
    var onDelete: () -> Void
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 16, weight: .regular))
            
            Spacer()
            
            Button(action: onDelete) {
                Image(systemName: "xmark.circle")
                    .foregroundColor(Color(hex: "999999"))
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 14)
    }
}

#Preview {
    RecentSearchItemView(title: "Jeans", onDelete: {})
}
