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
    
    @Published var searchText = ""
    @Published var selectedCategory: String? = nil
    private var repository: ProductRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()
    
    private var currentLimit = 10
    private let step = 5
    
    init( repository: ProductRepositoryProtocol = ProductRepository()) {
        self.repository = repository
    }
    
    func fetchProducts() {
        guard !isLoading else { return }
        isLoading = true
        
        repository.fetchAllProduct(limit: currentLimit)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] (products: [Product]) in
                self?.products = products
            })
            .store(in: &cancellables)
    }
    func loadMoreIfNeeded(product: Product) {
        if product.id == products.last?.id && currentLimit < 20 {
            currentLimit += step
            fetchProducts()
            print("---Loading more products... The Limit is: \(currentLimit)")
        }
    }
    var filteredProducts: [Product] {
        products.filter { product in
            let searchMatch = searchText.isEmpty || product.title.localizedCaseInsensitiveContains(searchText)
            let categoryMatch = selectedCategory == nil || product.category == selectedCategory
            return searchMatch && categoryMatch
        }
       
    }
    
}
