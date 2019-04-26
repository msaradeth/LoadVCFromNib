//
//  ListVC.swift
//  LoadVCFromNib
//
//  Created by Mike Saradeth on 4/26/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class ListVC: UITableViewController {
    var viewModel: ListViewModel!
    
    init(title: String, viewModel: ListViewModel, nibName: String) {  
        self.viewModel = viewModel
        super.init(nibName: nibName, bundle: nil)
        self.title = title
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        
        viewModel.loadData { [weak self] in
            self?.tableView.reloadData()
        }
    }

    func setupVC() {
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: ListTableViewCell.cellIdentifier)
    }

 
    // MARK: - Table view data source and delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellIdentifier, for: indexPath) as! ListTableViewCell
        cell.configure(item: viewModel.items[indexPath.row], delegate: viewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = viewModel.items[indexPath.row]
        let detailViewModel = DetailViewModel(item: item)
        let detailVC = DetailVC(title: item.name, viewModel: detailViewModel, nibName: "DetailVC")
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Invalid init")
    }
}
