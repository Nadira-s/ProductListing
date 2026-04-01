//
//  APIRouter.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 18.03.2026.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case getProducts(limit: Int)
    case getProductDetails(id: Int)
    case getCategories
    
    private var baseURl: String {
        return "https://fakestoreapi.com"
    }
    
    private var path: String {
        switch self {
        case .getProducts(let limit):
            return "/products?limit=\(limit)"
        case .getProductDetails(let id):
            return "/products/\(id)"
        case .getCategories:
            return "/products/categories"
        }
    }
    
    private var method: HTTPMethod {
        return .get
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let urlString = baseURl + path
        
        guard let url = URL(string: urlString) else {
            throw AFError.parameterEncodingFailed(reason: .missingURL)
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return urlRequest
    }
    
}
