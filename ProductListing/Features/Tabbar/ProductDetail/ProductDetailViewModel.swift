//
//  ProductDetailViewModel.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 26.03.2026.
//

import Foundation
import Combine

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchProductDetails(id: Int) {
        isLoading = true
        
        networkService.request(endpoint: APIRouter.getProductDetails(id: id))
            .sink(receiveCompletion: {[weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: {[weak self] (product: Product) in
                self?.product = product
            })
            .store(in: &cancellables)
    }
}
