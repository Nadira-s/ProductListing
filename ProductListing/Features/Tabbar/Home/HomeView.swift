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
                    List(viewModel.products) { product in
                        ProductRow(product: product)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Shop")
            .onAppear {
                viewModel.fetchProducts()
            }
        }
    }
}
