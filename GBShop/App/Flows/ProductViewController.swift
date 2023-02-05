//
//  ProductViewController.swift
//  GBShop
//
//  Created by Оксана Каменчук on 04.02.2023.
//

import UIKit

final class ProductViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView = UITableView()
    private let addToBasketView = UIView()
    private let quantityControl = QuantityControl()
    private let addToBasketButton = AddToBasketButton()
    private let requestFactory = RequestFactory()
    private let productName: String
    private let productID: Int
    private var product: ProductResult? = nil {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(productID: Int, productName: String) {
        self.productID = productID
        self.productName = productName
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let getGood = requestFactory.makeProductRequestFactory()
        getGood.getProduct(productId: 1) { response in
                switch response.result {
                case .success(let getGood):
                    self.product = getGood
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        addViews()
        layoutViews()
        configure()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if product != nil {
            return 1
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 300
        case 1:
            return 80
        case 2:
            return UITableView.automaticDimension
        case 3:
            return 85
        case 4:
            return 365
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell!
        switch indexPath.section {
        case 0:
            cell = ProductPictureCell(picture: UIImage(named: product?.productPicture ?? "empty_pic") ?? UIImage())
        case 1:
            cell = ProductPriceCell(price: product?.productPrice ?? 0)
        case 2:
            cell = ProductDescriptionCell(
                name: product?.productName ?? "",
                description: product?.productDescription ?? "")
        case 3:
            cell = ProductRatingCell(
                rating: product?.productRating ?? 0,
                reviews: product?.reviewsNumber ?? 0)
        case 4:
            cell = ProductReviewsCell(
                name: product?.productReview.first?.reviewAuthor ?? "",
                date: product?.productReview.first?.reviewDate ?? "",
                review: product?.productReview.first?.text ?? "")
        default:
            cell = UITableViewCell()
        }
        cell.selectionStyle = .none
        return cell
    }
}

extension ProductViewController {
    override func addViews() {
        super.addViews()
        view.addSubview(tableView)
        view.addSubview(addToBasketView)
        addToBasketView.addSubview(quantityControl)
        addToBasketView.addSubview(addToBasketButton)
    }
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: addToBasketView.topAnchor),
            
            addToBasketView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            addToBasketView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            addToBasketView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -83),
            addToBasketView.heightAnchor.constraint(equalToConstant: 60),
            
            quantityControl.centerYAnchor.constraint(equalTo: addToBasketView.centerYAnchor),
            quantityControl.leadingAnchor.constraint(equalTo: addToBasketView.leadingAnchor, constant: 10),
            quantityControl.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 15),
            
            addToBasketButton.centerYAnchor.constraint(equalTo: addToBasketView.centerYAnchor),
            addToBasketButton.trailingAnchor.constraint(equalTo: addToBasketView.trailingAnchor, constant: -10),
            addToBasketButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 15),
        ])
    }
    override func configure() {
        super.configure()
        headerTitle.text = productName
        setLeftHeaderButton(image: UIImage(named: "back_arrow_icon") ?? UIImage(), selector: #selector(backButtonPressed))
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        
        addToBasketView.translatesAutoresizingMaskIntoConstraints = false
        addToBasketView.backgroundColor = .white
        
        quantityControl.translatesAutoresizingMaskIntoConstraints = false
        
        addToBasketButton.translatesAutoresizingMaskIntoConstraints = false
        addToBasketButton.setTitle("В корзину", for: .normal)
        addToBasketButton.addTarget(self, action: #selector(addToBasket), for: .touchUpInside)
    }
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    @objc func addToBasket() {
        if let product = self.product {
            var isAlreadyExistsIndex = -1
            for index in BasketDataSingleton.shared.basketData.indices {
                if BasketDataSingleton.shared.basketData[index].0.productId == product.productId {
                    isAlreadyExistsIndex = index
                }
            }
            if isAlreadyExistsIndex > -1 {
                BasketDataSingleton.shared.basketData[isAlreadyExistsIndex].1 += self.quantityControl.getQuantity()
            } else {
                BasketDataSingleton.shared.basketData.append((product, self.quantityControl.getQuantity()))
            }
            BasketDataSingleton.shared.updateTotalPrice()
        }
    }
}
