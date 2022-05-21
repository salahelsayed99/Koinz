//
//  NetworkManager.swift
//  Koinz
//
//  Created by Salah  on 20/05/2022.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<UserService> { get }
    func fetchPhotos(page: Int, completion: @escaping (Result<Photos, Error>) -> ())
}

class NetworkManager: Networkable {

    var provider = MoyaProvider<UserService>(plugins: [NetworkLoggerPlugin()])
    
    func fetchPhotos(page: Int, completion: @escaping (Result<Photos, Error>) -> ()) {
        request(target: .getPhotos(page: page), completion: completion)
    }

    
}

private extension NetworkManager {
    private func request<T: Decodable>(target: UserService, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

