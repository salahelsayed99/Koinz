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
    
    var data:String?{
        didSet{
            photoImage.kf.setImage(with: URL(string: data ?? ""))
        }
    }
    

}
