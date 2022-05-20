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
        //tableView.estimatedRowHeight = 150
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: Constants.photoCell, bundle: nil), forCellReuseIdentifier: Constants.photoCell)
    }
    

    func setUpBinding(){
        tableView.reloadData()
        viewModel.photos.bind(to: tableView.rx.items(cellIdentifier: Constants.photoCell, cellType: PhotoCell.self)) {  (row,photo,cell) in
            cell.data = photo
            }
        .disposed(by: disposeBag)
        
        
        viewModel.getPhotos(page: 1)
    }

}

