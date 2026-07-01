//
//  VendorItemView.swift
//  Drape
//
//  Created by Moaz on 30/06/2026.
//
import SwiftUI

struct VendorItemView: View {
    let vendorName: String
    let logoURL: String
    var onTap: () -> Void = {}
    
    var body: some View {
        Button(action:onTap) {
            VStack(spacing: 8) {
                AsyncImage(url: URL(string: logoURL)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Image(systemName: "photo")
                            .foregroundStyle(.gray.opacity(0.6))
                    default:
                        EmptyView()
                    }
                }
                .frame(width: 40, height: 40)
                .frame(width: 86, height: 86)
                .background {
                    RoundedRectangle(cornerRadius: 16.0)
                        .fill(Color(hex: "F8FAFC"))
                }
                
                Text(vendorName)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    VendorItemView(vendorName: "Nike", logoURL: "https://example.com/nike-logo.png")
}
