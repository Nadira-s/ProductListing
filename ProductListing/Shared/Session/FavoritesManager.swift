//
//  FavoritesManager.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 26.03.2026.
//

import SwiftUI
import Combine

class FavoritesManager: ObservableObject{
    
    @Published var favoriteIDs: Set<Int> = [] {
        didSet{
            save()
        }
    }
    private let key = "favorite_products_ids"
    
    init () {
        load()
    }
    func contains(_ product: Product) -> Bool {
        favoriteIDs.contains(product.id)
    }
    
    func toggle(_ product: Product) {
        if contains(product) {
            favoriteIDs.remove(product.id)
        }else {
            favoriteIDs.insert(product.id)
        }
    }
    private func save() {
        let array = Array(favoriteIDs)
        UserDefaults.standard.set(array, forKey: key)
    }
    private func load() {
        if let array = UserDefaults.standard.array(forKey: key) as? [Int] {
            favoriteIDs = Set(array)
        }
    }
}
