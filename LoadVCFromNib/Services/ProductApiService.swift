//
//  CatApiService.swift
//  CatApiCollectionView
//
//  Created by Mike Saradeth on 3/29/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation

class ProductApiService: NSObject {
    
    func loadData(completion: @escaping ([Product]) -> Void) {
        let urlString = "https://s3.us-east-2.amazonaws.com/juul-coding-challenge/products.json"
        var items: [Product] = []
        
        HttpHelper.request(urlString, method: .get, params: nil, success: { (responseObj) in
            guard let data = responseObj.data else { completion(items); return }
            do {
                let podService = try JSONDecoder().decode(PodsService.self, from: data)
                items = podService.products
            }catch let error {
                print(error.localizedDescription)   //handle error
            }
            completion(items)
            
        }) { (error) in
            print(error.localizedDescription)
            completion(items)
        }
    }
    
    
    
   static func loadMockData() -> [Product] {
        let product1 = Product.init(id: "e46567ab82044e528b810850bdeb9228", name: "mango", description: "Ripe mango with hints of tropical fruit.", price: 299, thumbnailUrl: "https://s3.us-east-2.amazonaws.com/juul-coding-challenge/images/mango_thumbnail.png", imageUrl: "https://s3.us-east-2.amazonaws.com/juul-coding-challenge/images/mango_hires.png")
        let product2 = Product.init(id: "6e02aa3c43554ca896dc4ce6890f890e", name: "cool mint", description: "Crisp peppermint with a soothing aftertaste.", price: 185, thumbnailUrl: "https://s3.us-east-2.amazonaws.com/juul-coding-challenge/images/mint_thumbnail.png", imageUrl: "https://s3.us-east-2.amazonaws.com/juul-coding-challenge/images/mint_hires.png")
        
        let items = [product1, product2]
        
        return items
    }
}
