//
//  AppSessionManager.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 19.03.2026.
//
import Combine
import SwiftUI

enum SessionState {
    case splash
    case home
}

class AppSessionManager: ObservableObject {
    
    @Published var sessionState: SessionState = .splash
}
