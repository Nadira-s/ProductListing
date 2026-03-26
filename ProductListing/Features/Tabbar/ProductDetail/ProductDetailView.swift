//
//  ProductDetailView.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 26.03.2026.
//

import SwiftUI

struct ProductDetailView: View {
    
    let productId: Int
    @StateObject private var viewModel = ProductDetailViewModel()
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, minHeight: 300)
                    
                }else if let product = viewModel.product {
                    AsyncImage(url: URL(string: product.image)) { image in
                        image.resizable().scaledToFit()
                            .frame(width:250, height: 250)
                            .background(Color.white)
                            .cornerRadius(8)
                    }placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity, minHeight: 300)
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text(product.title)
                            .font(.title2).bold()
                        Text(product.category.uppercased())
                            .font(.caption).foregroundColor(.secondary)
                        Text(product.formattedPrice)
                            .font(.title3).foregroundColor(.green).bold()
                        
                        Divider()
                        
                        Text("Description")
                            .font(.headline)
                        Text(product.description)
                            .font(.body)
                        
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchProductDetails(id: productId)
        }
    }
}


