//
//  Menu.swift
//  GBShop
//
//  Created by Оксана Каменчук on 12.01.2023.
//

import UIKit

final class Menu: NSObject {
    
    private enum SectionType: Int, CaseIterable {
        case banners
        case menu
    }
    
    var products = [CatalogDataResult]()
    
    var categoryHeaderView = CategoryHeaderView()
    
    var categories = [
        Category(id: 1, name: "Ноутбуки", selected: true),
        Category(id: 2, name: "Мышки"),
        Category(id: 3, name: "Мониторы"),
        Category(id: 4, name: "Клавиатуры"),
        Category(id: 5, name: "Наушники")
    ]
    
    //MARK: - Init
    override init() {
        categoryHeaderView.categories = categories
    }
}

//MARK: - Table View Data Source
extension Menu: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = SectionType.init(rawValue: section)
        
        switch sectionType {
        case .banners: return 1
        case .menu: return products.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = SectionType.init(rawValue: indexPath.section)
        
        switch sectionType {
        case .banners:
            let bannerCell = tableView.dequeueReusableCell(withIdentifier: BannerCell.reuseID)
            guard let cell = bannerCell as? BannerCell else { return UITableViewCell() }
            
            
            return cell
        case .menu:
            guard let menuCell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID) as? ProductCell else { return UITableViewCell() }
            let currentProduct = products[indexPath.row]
            menuCell.configure(currentProduct)
            return menuCell
        default:
            return UITableViewCell()
        }
    }
}

extension Menu: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionType = SectionType.init(rawValue: section)
        
        switch sectionType {
        case .banners: return UIView()
        case .menu: return categoryHeaderView
        default: return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionType = SectionType.init(rawValue: section)
        
        switch sectionType {
        case .banners: return 0
        case .menu: return 50
        default: return 0
        }
    }
}
