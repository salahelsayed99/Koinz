//
//  APIs.swift
//  Koinz
//
//  Created by Salah  on 20/05/2022.
//


import Foundation
import Moya


enum UserService {
    case getPhotos(page:Int)
}


extension UserService:TargetType{
    var baseURL: URL {
        return URL.init(string:Constants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getPhotos(_):
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPhotos(_):
            return .get
        }

    }
    
    var sampleData: Data{
        switch self {

        case .getPhotos(page: let page):
            return "{'page':'\(page)'}".data(using: .utf8)!

        }

    }
    
    var task: Task {
        switch self {
        case .getPhotos(page: let page):
            return .requestParameters(parameters: ["page":page], encoding: URLEncoding.default)
        }

    }
    
    var headers: [String : String]? {
        return ["Content-Typer":"application/json"]
    }
    
    
}
