//
//  PhotosViewModel.swift
//  Koinz
//
//  Created by Salah  on 20/05/2022.
//

import Foundation
import RxSwift
import RxCocoa



class ProfileViewModel{
    
    var photos : PublishSubject<[PhotoCellViewModel]> = PublishSubject()

    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    
    
    func createPhotoTableViewCells(_ photos:[Photo])->[PhotoCellViewModel]{
        return photos.map { photo in
            return PhotoCellViewModel(id: photo.id, secret: photo.secret, server: photo.server, farm: photo.farm)
        }
    }
    
    func getPhotos(page:Int){
        networkManager.fetchPhotos(page: page) { [weak self] result in
            switch result {
            case .success(let response):
                print(response)
                self?.photos.onNext(self?.createPhotoTableViewCells(response.photos.photo) ?? [])
            case .failure(let error):
                print(error)
            }
        }
    }
    
        
    
}
