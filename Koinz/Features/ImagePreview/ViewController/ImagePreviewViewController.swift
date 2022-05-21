//
//  ImagePreviewViewController.swift
//  Koinz
//
//  Created by Salah  on 21/05/2022.
//

import UIKit
import Kingfisher

class ImagePreviewViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imagePreview: UIImageView!
    
    
    var image:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    

    func setUpUI(){
        scrollView.minimumZoomScale = Constants.minZoomScale
        scrollView.maximumZoomScale = Constants.maxZoomScale
        imagePreview.kf.setImage(with: URL(string: image ?? ""))
    }

}
extension ImagePreviewViewController:UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imagePreview
    }
}
