//
//  Cache.swift
//  JUUL
//
//  Created by Mike Saradeth on 4/5/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit



class Cache: NSObject {
    static let shared = Cache()
    var tumbNail: [String: UIImage]
    var image: [String: UIImage]
    var isFavorite: [String: Bool]
    let defaults = UserDefaults.standard
    
    private override init() {
        tumbNail = [:]
        image = [:]
        isFavorite = [:]
    }
    
    func getFavorite(id: String) -> Bool? {
        let key = "Favorite" + id
        return isFavorite[key] != nil ? isFavorite[key] : defaults.bool(forKey:key)   //if in memory get from memory else get from disk logic
    }
    func setFavorite(id: String, isFavorite: Bool) {
        let key = "Favorite" + id
        self.isFavorite[key] = isFavorite
        //Write to disk
        defaults.set(isFavorite, forKey: key)
    }
    
    
}
