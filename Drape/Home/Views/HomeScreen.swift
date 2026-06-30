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
            HeaderHomeScreenView(onBellTap: {})
                .padding(.bottom , 16.0)
                .padding(.horizontal, 16.0)
                .padding(.top, 12.0)
            
            CustomSearchField(onTap: {})
                .padding(.bottom , 16.0)
                .padding(.horizontal, 16.0)
            
            CategoryChipListView()
                .padding(.bottom , 24.0)
                .padding(.leading, 16.0)
                
            Spacer()
            
        
        }
        
    }
}




#Preview {
    HomeScreen()
}
