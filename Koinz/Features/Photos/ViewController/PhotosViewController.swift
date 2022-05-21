//
//  PhotosViewController.swift
//  Koinz
//
//  Created by Salah  on 20/05/2022.
//

import UIKit
import RxSwift
import RxCocoa

class PhotosViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    private let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpBinding()
    }
    
    func setUpTableView(){
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: Constants.photoCell, bundle: nil), forCellReuseIdentifier: Constants.photoCell)
        tableView.register(UINib(nibName: Constants.adCell, bundle: nil), forCellReuseIdentifier: Constants.adCell)
    }
    
    
    
    
    func setUpBinding(){
        
        viewModel
            .error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self] (error) in
                self?.allerMessage(title: "", message: error)
            })
            .disposed(by: disposeBag)

        
        viewModel.photos.bind(to: tableView.rx.items(cellIdentifier: Constants.photoCell, cellType: PhotoCell.self)) {  (row,photo,cell) in
            cell.data = photo.imageURL
        }
        .disposed(by: disposeBag)
        
        
        tableView.rx.willDisplayCell
            .subscribe(onNext: ({ (cell,indexPath) in
                self.viewModel.nextPage(indexPath: indexPath)
            })).disposed(by: disposeBag)
        
        
        
        viewModel.getPhotos()
    }
    
}

