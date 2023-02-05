//
//  BasketViewController.swift
//  GBShop
//
//  Created by Оксана Каменчук on 03.02.2023.
//

import UIKit

protocol BasketViewInput: AnyObject {
    func showAlertController(with error: String)
    func startShowingActivityIndicator()
    func stopShowingActivityIndicator()
}

final class BasketViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, OptionButtonsDelegate {
    
    private var basketView: BasketView {
        guard let view = self.view as? BasketView else {
            let correctView = BasketView(frame: self.view.frame)
            self.view = correctView
            return correctView
        }
        return view
    }
    
    private let requestFactory = RequestFactory()
    private let tableView = UITableView()
    private let summaryView = UIView()
    private let clearBasketButton = ClearBasketButton()
    private let buyButton = BuyButton()
    private let summLabel = UILabel()
    
    var presenter: BasketViewOutput?
    
    override func loadView() {
        super.loadView()
        self.view = BasketView(frame: self.view.frame)
        basketView.basketViewController = self
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        basketView.unsubscribeObserver()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        addViews()
        layoutViews()
        configure()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        summLabel.text = "Сумма: \(BasketDataSingleton.shared.totalPrice) ₽"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BasketDataSingleton.shared.basketData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BasketCell(
            name: BasketDataSingleton.shared.basketData[indexPath.row].0.productName,
            image: UIImage(named: BasketDataSingleton.shared.basketData[indexPath.row].0.productPicture) ?? UIImage(),
            quantity: BasketDataSingleton.shared.basketData[indexPath.row].1,
            price: Double(BasketDataSingleton.shared.basketData[indexPath.row].0.productPrice) * Double(BasketDataSingleton.shared.basketData[indexPath.row].1))
        cell.selectionStyle = .none
        cell.delegate = self
        cell.indexPath = indexPath
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func deleteButtonTapped(at index: IndexPath) {
        BasketDataSingleton.shared.basketData.remove(at: index.row)
        BasketDataSingleton.shared.updateTotalPrice()
        summLabel.text = "Сумма: \(BasketDataSingleton.shared.totalPrice) ₽"
        tableView.reloadData()
    }
    
    func quantityButtonTapped(at index: IndexPath) {
        print("quantity button tapped at index:\(index)")
    }
}

@objc extension BasketViewController {
    override func addViews() {
        super.addViews()
        view.addSubview(tableView)
        view.addSubview(summaryView)
        summaryView.addSubview(clearBasketButton)
        summaryView.addSubview(buyButton)
        summaryView.addSubview(summLabel)
    }
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: summaryView.topAnchor),
            
            summaryView.heightAnchor.constraint(equalToConstant: 90),
            summaryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            summaryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            summaryView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -83),
            
            clearBasketButton.leadingAnchor.constraint(equalTo: summaryView.leadingAnchor, constant: 10),
            clearBasketButton.trailingAnchor.constraint(equalTo: summaryView.centerXAnchor, constant: -5),
            clearBasketButton.bottomAnchor.constraint(equalTo: summaryView.bottomAnchor, constant: -10),
            
            buyButton.leadingAnchor.constraint(equalTo: summaryView.centerXAnchor, constant: 5),
            buyButton.trailingAnchor.constraint(equalTo: summaryView.trailingAnchor, constant: -10),
            buyButton.bottomAnchor.constraint(equalTo: summaryView.bottomAnchor, constant: -10),
            
            summLabel.leadingAnchor.constraint(equalTo: summaryView.leadingAnchor, constant: 10),
            summLabel.trailingAnchor.constraint(equalTo: summaryView.centerXAnchor, constant: -5),
            summLabel.topAnchor.constraint(equalTo: summaryView.topAnchor, constant: 10),
        ])
    }
    override func configure() {
        super.configure()
        headerTitle.text = "Корзина"
        setLeftHeaderButton(image: UIImage(named: "back_arrow_icon") ?? UIImage(), selector: #selector(backButtonPressed))
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        summaryView.translatesAutoresizingMaskIntoConstraints = false
        summaryView.backgroundColor = .white
        
        clearBasketButton.translatesAutoresizingMaskIntoConstraints = false
        clearBasketButton.addTarget(self, action: #selector(clearBasket), for: .touchUpInside)
        
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.addTarget(self, action: #selector(buy), for: .touchUpInside)
        
        summLabel.translatesAutoresizingMaskIntoConstraints = false
        summLabel.font = UIFont.systemFont(ofSize: 24)
        summLabel.text = "Сумма: \(BasketDataSingleton.shared.totalPrice) ₽"
        summLabel.textAlignment = .left
        summLabel.adjustsFontSizeToFitWidth = true
        summLabel.minimumScaleFactor = 0.5
    }
    
    func backButtonPressed() {
        dismiss(animated: true)
    }
    
    func clearBasket() {
        BasketDataSingleton.shared.basketData.removeAll()
        BasketDataSingleton.shared.updateTotalPrice()
    }
    
    func buy() {
        let buyViewController = BaseViewController()
        navigationController?.pushViewController(buyViewController, animated: true)
    }
}

extension BasketViewController: BasketViewInput {
    func showAlertController(with error: String) {
        DispatchQueue.main.async {
            self.present(self.basketView.presentAlert(error: error),
                         animated: true)
        }
    }
    
    func startShowingActivityIndicator() {
        DispatchQueue.main.async {
            self.basketView.activityIndicator.startAnimating()
        }
    }
    
    func stopShowingActivityIndicator() {
        DispatchQueue.main.async {
            self.basketView.activityIndicator.stopAnimating()
        }
    }
}

