//
//  Util.swift
//  JUUL
//
//  Created by Mike Saradeth on 4/5/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit


class Util: NSObject {
    
    static func loadImage(imageUrl: String, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            guard let imageURL = URL(string: imageUrl),
                let imageData = try? Data(contentsOf: imageURL),
                let image =  UIImage(data: imageData) else { completion(nil); return }
            completion(image)
        }
    }
    
}
