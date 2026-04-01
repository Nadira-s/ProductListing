//
//  FavoritesView.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 26.03.2026.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
            List{
                let favoriteProducts = homeViewModel.products.filter {
                    favoritesManager.favoriteIDs.contains($0.id)
                }
                if favoriteProducts.isEmpty {
                    ContentUnavailableView("No favorite products", systemImage: "heart.slash", description: Text("Add products that you like"))
                }else {
                    ForEach(favoriteProducts) { product in
                        NavigationLink(value: product) {
                            ProductRow(product: product)
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
            .onAppear{
                if homeViewModel.products.isEmpty {
                    homeViewModel.fetchProducts()
                }
            }
    }
}
