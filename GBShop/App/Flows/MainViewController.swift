//
//  MainViewController.swift
//  GBShop
//
//  Created by Оксана Каменчук on 24.01.2023.
//

import UIKit

protocol MainViewInput: AnyObject {
    func reloadTable(withProducts: [CatalogDataResult])
}

final class MainViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView()
    private var isFilterShown = false
    private var heightWithFilterConstraint: NSLayoutConstraint!
    private let requestFactory = RequestFactory()
    private var myCatalog = [CatalogDataResult]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private var mainView: MainView {
        guard let view = self.view as? MainView else {
            let correctView = MainView(frame: self.view.frame)
            self.view = correctView
            return correctView
        }
        return view
    }
    
    var presenter: MainViewPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        addViews()
        layoutViews()
        configure()
        
        let getCatalog = requestFactory.makeCatalogRequestFactory()
        getCatalog.getProductData(pageNumber: 1,
                                  categoryId: 1) { response in
                switch response.result {
                case .success(let getCatalog):
                    self.myCatalog = [getCatalog]
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCatalog.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CatalogCell()
        cell.configureData(
            name: myCatalog[indexPath.row].productName,
            picture: myCatalog[indexPath.row].imageUrl)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productVC = ProductViewController(productID: indexPath.row, productName: myCatalog[indexPath.row].productName)
        navigationController?.pushViewController(productVC, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
}

@objc extension MainViewController {
    override func addViews() {
        super.addViews()
        view.addSubview(tableView)
    }
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        heightWithFilterConstraint = headerView.heightAnchor.constraint(equalToConstant: 100)
    }
    override func configure() {
        super.configure()
        headerTitle.text = "Каталог"
        setLeftHeaderButton(image: UIImage(named: "back_arrow_icon") ?? UIImage(), selector: #selector(backButtonPressed))
        setRightHeaderButton(image: UIImage(named: "filter_inactive_icon.png") ?? UIImage(), selector: #selector(filterButtonPressed))
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    func backButtonPressed() {
        self.dismiss(animated: true)
    }
    func filterButtonPressed() {
        if headerView.translatesAutoresizingMaskIntoConstraints {
            headerView.translatesAutoresizingMaskIntoConstraints.toggle()
        }
        if !isFilterShown {
            isFilterShown.toggle()
            self.heightWithFilterConstraint.constant = 150
            UIView.animate(withDuration: 0.5) {
                self.heightWithFilterConstraint.isActive = true
                self.view.layoutIfNeeded()
            }
        } else {
            isFilterShown.toggle()
            self.heightWithFilterConstraint.constant = 100
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
}
