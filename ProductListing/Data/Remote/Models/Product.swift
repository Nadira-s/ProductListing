//
//  Product.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 18.03.2026.
//

import Foundation

struct Product: Identifiable, Codable, Hashable{
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
    var formattedPrice: String {
        return String(format: "$%.2f", price)
    }
}

struct Rating: Codable, Hashable{
    let rate: Double
    let count: Int
}
