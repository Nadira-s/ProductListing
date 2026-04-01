//
//  ProductRepository.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 18.03.2026.
//

import Foundation
import Combine

protocol ProductRepositoryProtocol {
    func fetchAllProduct(limit: Int) -> AnyPublisher<[Product], Error>
}

final class ProductRepository: ProductRepositoryProtocol {
    private var networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchAllProduct(limit: Int) -> AnyPublisher<[Product], Error> {
        return networkService.request(endpoint: APIRouter.getProducts(limit: limit))
    }
}
