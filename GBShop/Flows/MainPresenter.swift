//
//  MainPresenter.swift
//  GBShop
//
//  Created by Оксана Каменчук on 12.01.2023.
//

import UIKit

protocol MainViewOutput: AnyObject {
    func loadCatalog()
    func didLoadCatalog(catalog: [CatalogDataResult])
}

final class MainViewPresenter {
    weak var mainView: MainViewInput?
    var router: MainViewRouterProtocol
    var interactor: MainViewInteractorProtocol
    
    init(interactor: MainViewInteractorProtocol,
         router: MainViewRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension MainViewPresenter: MainViewOutput {
    func loadCatalog() {
        interactor.startLoadCatalog()
    }
    
    func didLoadCatalog(catalog: [CatalogDataResult]) {
        mainView?.reloadTable(withProducts: catalog)
    }
}
