//
//  UITableView+Ext.swift
//  LoadVCFromNib
//
//  Created by Mike Saradeth on 4/26/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    static func initWith(rowHeight: CGFloat, dataSource: UITableViewDataSource, delegate: UITableViewDelegate) -> UITableView {
        let tableView = UITableView(frame: .zero)
        tableView.rowHeight = rowHeight
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        return tableView
    }
}
