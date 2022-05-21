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
    
    var photos = BehaviorRelay(value: [PhotoCellViewModel]())

    var count = 1
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    
    
    func createPhotoTableViewCells(_ photos:[Photo])->[PhotoCellViewModel]{
        let pcvm = photos.map { photo in
            return PhotoCellViewModel(id: photo.id, secret: photo.secret, server: photo.server, farm: photo.farm, isAd: false)
        }
        return pcvm.adding(PhotoCellViewModel(id: "", secret: "", server: "", farm: 0, isAd: true), afterEvery: 5)
    }
    
    func getPhotos(){
        networkManager.fetchPhotos(page: count) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.photos.accept(self.photos.value + self.createPhotoTableViewCells(response.photos.photo))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func nextPage(indexPath:IndexPath){
        if indexPath.row == photos.value.count - 1{
            count+=1
            getPhotos()
        }
        
    }
    
        
    
}
