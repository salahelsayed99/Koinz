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
    
    var photos = BehaviorRelay(value: [PhotoVM]())
    public let error : PublishSubject<String> = PublishSubject()
    
    
    
    
    private var count = 1
    
    private let networkManager: NetworkManager
    private let persistence = PersistanceService.shared
    
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    
    
    func createPhotoTableViewCells(_ photos:[Photo])->[PhotoVM]{
        let pcvm = photos.map { photo in
            return PhotoCellViewModel(id: photo.id, secret: photo.secret, server: photo.server, farm: photo.farm, isAd: false)
        }
        
        let totalDataSource = pcvm.adding(PhotoCellViewModel(id: "", secret: "", server: "", farm: 0, isAd: true), afterEvery: 5)
        
        return totalDataSource.map { photo in
            let newItem = PhotoVM(context: self.persistence.context)
            newItem.imageURL = photo.imageURL
            newItem.isAd = photo.isAd
            return newItem
        }
    }
    
    func getPhotos(){
        if Reachability.isConnectedToNetwork(){
                    networkManager.fetchPhotos(page: count) { [weak self] result in
                        guard let self = self else { return }
                        switch result {
                        case .success(let response):
                            self.photos.accept(self.photos.value + self.createPhotoTableViewCells(response.photos.photo))
                            ThreadsUtility.execute({
                                self.persistence.saveContext()
                            }, afterDelay: 0.0)
                        case .failure(_):
                            self.error.onNext("Unknown Error")
                        }
                    }
        }else{
            self.persistence.fetch(PhotoVM.self) {[weak self] fetchedData in
                guard let self = self else { return }
                if fetchedData.count == 0{
                    self.error.onNext("No Cached Data")
                }else{
                    self.photos.accept(self.photos.value + fetchedData)
                }
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
