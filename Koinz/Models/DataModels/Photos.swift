//
//  Photos.swift
//  Koinz
//
//  Created by Salah  on 20/05/2022.
//

import Foundation

struct Photos: Codable {
    let photos: PhotosClass
}

// MARK: - PhotosClass
struct PhotosClass: Codable {
    let photo: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    let id, secret, server: String
    let farm: Int
}
