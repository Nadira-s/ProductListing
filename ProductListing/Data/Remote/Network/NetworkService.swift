//
//  NetworkService.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 18.03.2026.
//

import Foundation
import Alamofire
import Combine


protocol NetworkServiceProtocol {
    func request<T: Codable>(endpoint: URLRequestConvertible) -> AnyPublisher<T, Error>
}

final class NetworkService: NetworkServiceProtocol {
    func request<T: Codable>(endpoint: URLRequestConvertible) -> AnyPublisher<T, Error> {
        
        return AF.request(endpoint)
            .validate()
            .publishDecodable(type: T.self)
            .value()
            .mapError{$0 as Error}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
