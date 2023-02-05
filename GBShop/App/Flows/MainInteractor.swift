//
//  MainInteractor.swift
//  GBShop
//
//  Created by Оксана Каменчук on 24.01.2023.
//

import UIKit

protocol MainViewInteractorProtocol {
    func startLoadCatalog()
}

final class MainViewInteractor {
    weak var presenter: MainViewOutput?
    
    var networkService: ProductRequestFactory
    
    init(networkService: ProductRequestFactory) {
        self.networkService = networkService
    }
}

extension MainViewInteractor: MainViewInteractorProtocol {
    func startLoadCatalog() {
        networkService.getProductData(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
            case .success(let catalog):
                self.presenter?.loadCatalog()
            case .failure(let error):
                print(error)
            }
        }
    }
}

