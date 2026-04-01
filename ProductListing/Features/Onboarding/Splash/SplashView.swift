//
//  ContentView.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 14.03.2026.
//

import SwiftUI

struct SplashView: View {
    
    @EnvironmentObject var sessionManager: AppSessionManager
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing:20){
                Image(systemName: "cart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:100, height: 100)
                    .foregroundColor(.blue)
                
                Text("Shop App")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    sessionManager.sessionState = .home
                }
            }
        }
    }
    
}

#Preview {
    SplashView()
}
