//
//  ProductRow.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 18.03.2026.
//
import SwiftUI

struct ProductRow: View {
    let product: Product
    var body: some View {
        HStack(spacing: 15){
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 70, height:70)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                Text(product.formattedPrice)
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
        }
        .padding(.vertical, 5)
    }
}
