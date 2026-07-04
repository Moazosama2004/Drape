//
//  ProductDetailsScreen.swift
//  Drape
//
//  Created by Me3bed on 03/07/2026.
//

import SwiftUI

public struct ProductDetailsScreen: View {
    
    public var productId: Int 
    
    private var sizes = ["M","S","L"]
    @State private var selectedSize: String? = "M"
    @State private var isFavourite: Bool = false
    
    public init(productId: Int) {
        self.productId = productId
    }
    public var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading){
                    productImageSection(isFavorite: $isFavourite)
                    titleAndRatingSection(title: "Regular Fit Solgan",rating: 4.0,
                    reviewCount: 29
                    ).padding(.bottom , 10)
                    descriptionSection(text: "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist. The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.it all, the right size slightly snugs the body ")
                        .padding(.bottom , 10)
                    sizeSelectionSection(sizes: sizes,  selectedSize: $selectedSize).padding(.bottom , 10)
                    
                }.padding(.all , 24)
            }
            Spacer()
            bottomBarSection(price: 1200.0,onAddToCart: {})
        }.navigationTitle("Product Details")
            .navigationBarTitleDisplayMode(.inline)
    }
          
}

extension ProductDetailsScreen {
    func productImageSection(
        imageName: String? = nil,
        isFavorite: Binding<Bool>
    ) -> some View {
        ZStack(alignment: .topTrailing) {
            Group {
                if let imageName = imageName, UIImage(named: imageName) != nil {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    Rectangle()
                        .fill(Color(.systemGray5))
                        .overlay(
                            Image(systemName: "photo")
                                .font(.system(size: 40))
                                .foregroundColor(.gray)
                        )
                }
            }
            .frame(height: 350)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .clipped()

            Button(action: {
                isFavorite.wrappedValue.toggle()
            }) {
                Image(systemName: isFavorite.wrappedValue ? "heart.fill" : "heart")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.red)
                    .padding(10)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            }
            .padding(16)
        }.padding(.bottom , 12)
    }
}

extension ProductDetailsScreen {
    func titleAndRatingSection(
        title: String? = nil,
        rating: Double? = nil,
        reviewCount: Int? = nil
    ) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title ?? "")
                .font(.system(size: 24))
                .fontWeight(.bold)
                
            HStack(spacing: 4) {
                 Image(systemName: "star.fill")
                     .foregroundColor(.orange)
                     .font(.system(size: 14))

                 if let rating = rating {
                     Text("\(String(format: "%.1f", rating))/5")
                         .font(.subheadline)
                         .fontWeight(.semibold)
                 }

                 if let reviewCount = reviewCount {
                     Text("(\(reviewCount) reviews)")
                         .font(.subheadline)
                         .foregroundColor(.gray)
                         .underline()
                 }
             }
                
            }
        
    }
}


extension ProductDetailsScreen {
    func descriptionSection(text: String? = nil) -> some View {
        Text(text ?? "")
            .font(.subheadline)
            .foregroundColor(.gray)
            .lineSpacing(4)
    }
}

extension ProductDetailsScreen {
    func sizeSelectionSection(
        sizes: [String]? = nil,
        selectedSize: Binding<String?>
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Choose size")
                .font(.system(size: 20))
                .fontWeight(.bold)

            HStack(spacing: 12) {
                ForEach(sizes ?? [], id: \.self) { size in
                    Button(action: {
                        selectedSize.wrappedValue = size
                    }) {
                        Text(size)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(selectedSize.wrappedValue == size ? .white : .black)
                            .frame(width: 48, height: 48)
                            .background(
                                selectedSize.wrappedValue == size ? Color.black : Color(.systemGray6)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
            }
        }
    }
}

extension ProductDetailsScreen {
    func bottomBarSection(
        price: Double? = nil,
        onAddToCart: (() -> Void)? = nil
    ) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Price")
                    .font(.caption)
                    .foregroundColor(.gray)

                if let price = price {
                    Text("$ \(String(format: "%.0f", price))")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }.padding(.trailing , 20)

            Spacer()

            CustomButton(type: .primary,
                        
                         text: "Add to Cart", action: {
                         onAddToCart
            }
                         ,status: .enable,
                         leading: Image(systemName: "cart.fill")
            
            )

        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color.white)
    }
}
#Preview {
    //ProductDetailsScreen()
}
