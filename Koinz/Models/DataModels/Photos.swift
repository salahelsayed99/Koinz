//
//  Photos.swift
//  Koinz
//
//  Created by Salah  on 20/05/2022.
//

import Foundation

struct Photos: Codable {
    let photos: PhotosClass
    let stat: String
}

// MARK: - PhotosClass
struct PhotosClass: Codable {
    let page, pages, perpage, total: Int
    let photo: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
}
