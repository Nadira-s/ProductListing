//
//  ProductListingApp.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 14.03.2026.
//

import SwiftUI

@main
struct ProductListingApp: App {
    @StateObject private var sessionManager = AppSessionManager()
    @StateObject private var favoritesManager = FavoritesManager()
    var body: some Scene {
        WindowGroup {
            SessionView()
                .environmentObject(sessionManager)
                .environmentObject(favoritesManager)
        }
    }
}
