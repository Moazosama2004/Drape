//
//  SplashScreen.swift
//  Drape
//
//  Created by Me3bed on 27/06/2026.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    
    var body: some View {
        if isActive {
            if isFirstLaunch {
                OnBoardingScreen()
            } else {
                SignInView()
            }
        } else {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                Image("drape_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(.easeInOut) {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
