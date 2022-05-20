//
//  PhotoCell.swift
//  Koinz
//
//  Created by Salah  on 20/05/2022.
//

import UIKit
import Kingfisher

class PhotoCell: UITableViewCell {
    @IBOutlet weak var photoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var data:PhotoCellViewModel?{
        didSet{
            print(data?.imageURL)
            photoImage.kf.setImage(with: data?.imageURL)
        }
    }
    

}
