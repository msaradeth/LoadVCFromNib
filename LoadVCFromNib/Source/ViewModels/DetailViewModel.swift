//
//  DetailViewModel.swift
//  LoadVCFromNib
//
//  Created by Mike Saradeth on 4/26/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

class DetailViewModel: NSObject {
    var item: Product
    
    init(item: Product) {
        self.item = item
    }
    
    func loadImage(completion: @escaping (UIImage?) -> Void) {
        if let image = Cache.shared.image[item.imageUrl] {
            completion(image)
        }else {
            Util.loadImage(imageUrl: item.imageUrl, completion: { [weak self] (image) in
                guard let self = self, let image = image else { completion(nil); return }
                Cache.shared.image[self.item.imageUrl] = image
                completion(image)
            })
        }
    }
}
