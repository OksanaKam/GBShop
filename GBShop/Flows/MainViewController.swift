//
//  MainViewController.swift
//  GBShop
//
//  Created by Оксана Каменчук on 10.01.2023.
//

import UIKit

protocol MainViewInput: AnyObject {
    func reloadTable(withProducts: [CatalogDataResult])
}

final class MainViewController: UIViewController {
    
    //MARK: - Properties
    private var mainView: MainView {
        guard let view = self.view as? MainView else {
            let correctView = MainView(frame: self.view.frame)
            self.view = correctView
            return correctView
        }
        return view
    }
    
    var presenter: MainViewPresenter?
    
    let requestFactory = RequestFactory()
    
    var tableAdapter: Menu?
    
    init(presenter: MainViewPresenter, tableAdapter: Menu) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.tableAdapter = tableAdapter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableAdapter?.categoryHeaderView.delegateCell = self
        mainView.tableView.delegate = tableAdapter
        mainView.tableView.dataSource = tableAdapter
        
        presenter?.loadCatalog()
    }
}

extension MainViewController: MainViewInput {
    func reloadTable(withProducts: [CatalogDataResult]) {
        tableAdapter?.products = withProducts
        DispatchQueue.main.async {
            self.mainView.tableView.reloadData()
        }
    }
}

extension MainViewController: CategoryCollectionCellOutput {
    
    func categoryCollectionCellDidSelect(_ category: Category) {
        
        guard let categories = tableAdapter?.categories else { return }
        
        for item in categories {
            if item.id == category.id {
                item.selected = true
            } else {
                item.selected = false
            }
        }
        
        tableAdapter?.categoryHeaderView.update(categories)
        
        var row = 0
        
        switch category.name {
        case "Ноутбуки": row = 0
        case "Мышки": row = 1
        case "Мониторы": row = 2
        case "Клавиатуры": row = 3
        case "Наушники": row = 4
        default: break
        }
        
        mainView.tableView.scrollToRow(at: IndexPath(row: row, section: 1), at: .top, animated: true)
    }
}
