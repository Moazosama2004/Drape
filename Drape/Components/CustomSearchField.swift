//
//  CustomSearchField.swift
//  Drape
//
//  Created by Moaz on 29/06/2026.
//

import SwiftUI

struct CustomSearchField: View {
    @State private var searchTextValue: String = ""
    @FocusState private var isTyping: Bool
    var onTap: () -> Void
    
    private var borderColor: Color {
        isTyping ? .black : .gray.opacity(0.4)
    }
    
    var body: some View {
        HStack (spacing:8){
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(.gray.opacity(0.8))

   
                TextField("Search for clothes...", text: $searchTextValue)
                    .focused($isTyping)
                
                Spacer()
                
                Image(systemName: "mic")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(.gray.opacity(0.8))
                 
                
            }
            
            .padding(.horizontal, 20.0)
            .frame(height: 52)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: isTyping ? 2 : 1)
                    .fill(borderColor)
            }
            .animation(.easeInOut(duration: 0.2),value: isTyping)
            
            SliderFilterView(onTap:onTap)
           
        }
        
       
    }
}

struct SliderFilterView : View {
    var onTap: () -> Void
    var body: some View {
        Button(action: onTap) {
            Image(systemName: "slider.vertical.3")
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(.white)
                .frame(width: 52, height: 52)
                .background {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(.black)
                }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CustomSearchField(onTap: {})
}
