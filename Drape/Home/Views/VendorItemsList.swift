//
//  VendorItemsList.swift
//  Drape
//
//  Created by Moaz on 30/06/2026.
//

import SwiftUI

// will be removed
struct TempVendor: Identifiable {
    let id: Int
    let name: String
    let logoURL: String
}

struct VendorItemsList: View {
    let vendors: [TempVendor] = [
        TempVendor(id: 1, name: "Nike", logoURL: "https://example.com/nike-logo.png"),
        TempVendor(id: 2, name: "Adidas", logoURL: "https://example.com/adidas-logo.png"),
        TempVendor(id: 3, name: "Puma", logoURL: "https://example.com/puma-logo.png"),
        TempVendor(id: 4, name: "beko", logoURL: "https://example.com/beko-logo.png")
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(vendors) { vendor in
                    VendorItemView(vendorName: vendor.name, logoURL: vendor.logoURL)
                }
            }
        }
    }
}

#Preview {
    VendorItemsList()
}
