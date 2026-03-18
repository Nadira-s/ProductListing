//
//  APIRouter.swift
//  ProductListing
//
//  Created by Nadira Seitkazy  on 18.03.2026.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case getProducts
    case getProductDetails(id: Int)
    case getCategories
    
    private var baseURl: String {
        return "https://fakestoreapi.com"
    }
    
    private var path: String {
        switch self {
        case .getProducts:
            return "/products"
        case .getProductDetails(let id):
            return "/product/\(id)"
        case .getCategories:
            return "/products/categories"
        }
    }
    
    private var method: HTTPMethod {
        return .get
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseURl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return urlRequest
    }
    
}
