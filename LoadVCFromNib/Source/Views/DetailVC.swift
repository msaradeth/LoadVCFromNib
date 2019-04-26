//
//  DetailVC.swift
//  LoadVCFromNib
//
//  Created by Mike Saradeth on 4/26/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    
    var viewModel: DetailViewModel!
    
    init(title: String, viewModel: DetailViewModel, nibName: String) {
        self.viewModel = viewModel
        super.init(nibName: nibName, bundle: nil)
        self.title = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.productDescription.text = self.viewModel.item.description
            self.productPrice.text = self.viewModel.item.price.toMoney()
            self.productName.text = self.viewModel.item.name
        }
        
        viewModel.loadImage { [weak self] (image) in
            DispatchQueue.main.async {
                self?.productImageView.image = image
            }            
        }
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("Invalid init")
    }
}
