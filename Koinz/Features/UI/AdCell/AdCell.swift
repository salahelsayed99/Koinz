//
//  AdCell.swift
//  Koinz
//
//  Created by Salah  on 21/05/2022.
//

import UIKit
import Kingfisher

class AdCell: UITableViewCell {
    
    @IBOutlet weak var adImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        adImage.kf.setImage(with: URL(string: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/uploads/2020/06/banner-ad-examples-1024x536.jpg"))
    }
    
    

    
}
