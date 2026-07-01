//
//  DrapeApp.swift
//  Drape
//
//  Created by Moaz on 27/06/2026.
//

import SwiftUI
import FirebaseCore


@main
struct DrapeApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SignupView()
        }
    }
}
