//
//  UIView+Ext.swift
//  LoadVCFromNib
//
//  Created by Mike Saradeth on 4/26/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var safeGuide: UILayoutGuide {
        return safeAreaLayoutGuide
    }
    
    func fillSuperView() {
        guard let view = superview else { return }
        anchorTo(safeGuide: view.safeAreaLayoutGuide, padding: .zero)
    }
    
    func anchorTo(safeGuide: UILayoutGuide, padding: UIEdgeInsets) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: padding.top).isActive = true
        leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: padding.left).isActive = true
        bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor, constant: -padding.bottom).isActive = true
        trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -padding.right).isActive = true
    }
    
    
    func anchorSizeTo(safeGuide: UILayoutGuide) {
        widthAnchor.constraint(equalTo: safeGuide.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: safeGuide.heightAnchor).isActive = true
    }
    
}
