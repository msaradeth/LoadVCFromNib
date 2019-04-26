//
//  ListTableViewCell.swift
//  JUUL
//
//  Created by Mike Saradeth on 4/5/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    static let cellIdentifier = "Cell"
    let isFavoriteImage = UIImage(named: "MyFavorite")
    let notFavoriteImage = UIImage(named: "NotMyFavorite")
    
    @IBOutlet weak var imageContainView: UIView!
    @IBOutlet weak var tumbNail: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var myFavorite: UIImageView!
    var item: Product!
    var delegate: ListViewModelDelegate?
    
    func configure(item: Product, delegate: ListViewModelDelegate?) {
        self.item = item
        self.delegate = delegate
        self.productName.text = item.name
        self.productPrice.text = item.price.toMoney()
        addTapGestureRecognizer(view: imageContainView)
        
        //Set tumbnail and favorite images
        myFavorite.image = (Cache.shared.getFavorite(id: item.id) ?? false) ? isFavoriteImage : notFavoriteImage
        delegate?.getImage(imageUrl: item.thumbnailUrl, completion: { [weak self] (image) in
            DispatchQueue.main.async {
                self?.tumbNail.image = image
            }
        })
    }
    
    
    private func addTapGestureRecognizer(view: UIView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleFavorite(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    // Toggle favorite
    @objc private func toggleFavorite(_ sender: UITapGestureRecognizer) {
        let isMyFavorite = delegate?.toggleFavorite(id: item.id) ?? false
        myFavorite.image = (isMyFavorite) ? isFavoriteImage : notFavoriteImage
    }
    
}
