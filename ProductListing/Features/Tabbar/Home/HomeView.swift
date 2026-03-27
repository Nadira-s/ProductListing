//
//  HomeView.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 18.03.2026.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View{
        NavigationStack {
            ZStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }else if let error = viewModel.errorMessage {
                    VStack{
                        Text("Error: \(error)")
                        
                        Button("Try again"){
                            viewModel.fetchProducts()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }else {
                    List(viewModel.filteredProducts) { product in
                        NavigationLink(value: product){
                            ProductRow(product: product)
                        }
                        .onAppear {
                            viewModel.loadMoreIfNeeded(product: product)
                        }
                        
                    }
                    
                    .listStyle(.plain)
                    .navigationDestination(for: Product.self) { product in
                        ProductDetailView(product: product, productId: product.id)
                    }
                }
            }
            .navigationTitle("Shop")
            .searchable(text: $viewModel.searchText , prompt: "Search products...")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Menu {
                        Button("All Categories") {
                            viewModel.selectedCategory = nil
                        }
                        Divider()
                        Button("Electronics") {viewModel.selectedCategory = "electronics"}
                        Button("Jewelry") { viewModel.selectedCategory = "jewelery" }
                        Button("Men's Clothing") { viewModel.selectedCategory = "men's clothing" }
                        Button("Women's Clothing") { viewModel.selectedCategory = "women's clothing" }
                        
                    }label: {
                        Image(systemName: viewModel.selectedCategory == nil ? "line.3.horizontal.deacrese.circle" : "line.3.horizontal.deacrese.circle.fill" )
                            .foregroundColor(viewModel.selectedCategory == nil ? .blue : .orange)
                        Text(viewModel.selectedCategory?.capitalized ?? "Filter")
                                        .font(.subheadline)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: FavoritesView()) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    }
                }
            }
           
           
            
        }
        .onAppear {
            viewModel.fetchProducts()
            }
    }
}
