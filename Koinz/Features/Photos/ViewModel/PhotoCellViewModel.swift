//
//  PhotoCellViewModel.swift
//  Koinz
//
//  Created by Salah  on 20/05/2022.
//

import Foundation

struct PhotoCellViewModel {
    var id:String
    var secret:String
    var server:String
    var farm:Int
    var adImageURL = URL(string: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/uploads/2020/06/banner-ad-examples-1024x536.jpg")

    
    var imageURL:URL{
        get {
            return URL(string: "http://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg")!
        }
    }
    
    
}
