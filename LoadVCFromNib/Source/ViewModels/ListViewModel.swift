//
//  ListViewModel.swift
//  LoadVCFromNib
//
//  Created by Mike Saradeth on 4/26/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit


protocol ListViewModelDelegate {
    func getImage(imageUrl: String, completion: @escaping (UIImage?) -> Void)
    func toggleFavorite(id: String) -> Bool
}

class ListViewModel: NSObject {
    var favorites: [Product]
    var productApiService: ProductApiService
    var items: [Product] {
        didSet {
            favorites = items.filter({ Cache.shared.getFavorite(id: $0.id) == true })
        }
    }
    var segmentedControlIndex: Int {
        didSet {
            favorites = items.filter({ Cache.shared.getFavorite(id: $0.id) == true })
        }
    }
    var count: Int {
        return segmentedControlIndex == 0 ? items.count : favorites.count
    }
    subscript(index: Int) -> Product {
        return segmentedControlIndex == 0 ? items[index] : favorites[index]
    }
    
    init(items: [Product], segmentedControlIndex: Int, productApiService: ProductApiService) {
        self.items = items
        self.favorites = items.filter({ Cache.shared.getFavorite(id: $0.id) == true })
        self.segmentedControlIndex = segmentedControlIndex
        self.productApiService = productApiService
        
    }
    
    func loadData(completion: @escaping () -> Void) {
        productApiService.loadData { [weak self] (items) in
            self?.items = items
            completion()
        }
    }
}




extension ListViewModel: ListViewModelDelegate {
    func getImage(imageUrl: String, completion: @escaping (UIImage?) -> Void) {
        if let image = Cache.shared.tumbNail[imageUrl] {
            completion(image)
        }else {
            Util.loadImage(imageUrl: imageUrl, completion: { (image) in
                Cache.shared.tumbNail[imageUrl] = image
                completion(image)
            })
        }
    }
    
    func toggleFavorite(id: String) -> Bool {
        let toggleFavorite = !(Cache.shared.getFavorite(id: id) ?? false)
        Cache.shared.setFavorite(id: id, isFavorite: toggleFavorite)
        return toggleFavorite
    }
}
