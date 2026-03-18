//
//  HomeViewModel.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 18.03.2026.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var repository: ProductRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init( repository: ProductRepositoryProtocol = ProductRepository()) {
        self.repository = repository
    }
    
    func fetchProducts() {
        isLoading = true
        errorMessage = nil
        
        repository.fetchAllProduct()
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            }receiveValue: { [weak self] products in
                self?.products = products
            }
            .store(in: &cancellables)
    }
    
}
