//
//  SessionView.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 19.03.2026.
//

import SwiftUI

struct SessionView: View {
    @EnvironmentObject var sessionManager: AppSessionManager
    var body: some View{
        switch sessionManager.sessionState {
        case .splash:
            SplashView()
        case .home:
            NavigationStack {
                HomeView()
            }
        }
    }
}
