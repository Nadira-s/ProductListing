//
//  ProductRow.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 18.03.2026.
//
import SwiftUI

struct ProductRow: View {
    let product: Product
    @EnvironmentObject var favoritesManager: FavoritesManager
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
            Spacer()
            
            Button{
                withAnimation{
                    favoritesManager.toggle(product)
                }
            } label: {
                Image(systemName: favoritesManager.contains(product) ? "heart.fill" : "heart")
                    .foregroundColor(favoritesManager.contains(product) ? .red : .gray)
                    .font(.system(size: 20))
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.vertical, 5)
    }
}
