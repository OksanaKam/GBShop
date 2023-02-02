//
//  ReviewView.swift
//  GBShop
//
//  Created by Оксана Каменчук on 02.02.2023.
//

import UIKit

final class ReviewView: UIView {
    
    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.frame = self.bounds
        scrollView.contentSize = contentSize
        scrollView.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 1.0)
        scrollView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(hideKeyboard)))
        
        return scrollView
    }()
    
    private(set) lazy var contentView: UIView = {
        let view = UIView()
        view.frame.size = contentSize
        return view
    }()
    
    private var contentSize: CGSize {
        CGSize(width: frame.size.width, height: frame.size.height + 10)
    }
    
    private(set) lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ноутбук Apple MacBook Air 13 M1"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor(red: 241/255, green: 60/255, blue: 32/255, alpha: 1.0)
        return label
    }()
        
    private(set) lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "MacBook")
        return imageView
    }()
    
    private(set) lazy var leaveReviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Оставить отзыв:"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor(red: 64/255, green: 86/255, blue: 161/255, alpha: 1.0)
        return label
    }()
    
    private(set) lazy var leaveReviewTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 0.1
        textField.layer.cornerRadius = 5
        textField.placeholder = "Введите текст"
        return textField
    }()
    
    private(set) lazy var leaveReviewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Отправить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(UIColor(red: 64/255, green: 86/255, blue: 161/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(leaveReviewButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var reviewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Отзывы:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.backgroundColor = .lightGray
        return activityIndicator
    }()
    
    weak var reviewViewController: ReviewViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private methods
    private func configureUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        addProductImage()
        addProductNameLabel()
        addLeaveReviewLabel()
        addLeaveReviewTextField()
        addLeaveReviewButton()
        addReviewsLabel()
        addActivityIndicator()
    }
    
    private func addProductImage() {
        contentView.addSubview(productImage)
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            productImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productImage.widthAnchor.constraint(equalToConstant: 150),
            productImage.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func addProductNameLabel() {
        contentView.addSubview(productNameLabel)
        
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor,constant: 30),
            productNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func addLeaveReviewLabel() {
        contentView.addSubview(leaveReviewLabel)
        
        NSLayoutConstraint.activate([
            leaveReviewLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor,constant: 30),
            leaveReviewLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func addLeaveReviewTextField() {
        contentView.addSubview(leaveReviewTextField)
        
        NSLayoutConstraint.activate([
            leaveReviewTextField.topAnchor.constraint(equalTo: leaveReviewLabel.bottomAnchor,constant: 10),
            leaveReviewTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            leaveReviewTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            leaveReviewTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func addLeaveReviewButton() {
        contentView.addSubview(leaveReviewButton)
        
        NSLayoutConstraint.activate([
            leaveReviewButton.topAnchor.constraint(equalTo: leaveReviewTextField.bottomAnchor, constant: 10),
            leaveReviewButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            leaveReviewButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            leaveReviewButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addReviewsLabel() {
        contentView.addSubview(reviewsLabel)
        
        NSLayoutConstraint.activate([
            reviewsLabel.topAnchor.constraint(equalTo: leaveReviewButton.bottomAnchor, constant: 30),
            reviewsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func addActivityIndicator() {
        contentView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
    }
    
    func presentAlert(error: String) -> UIAlertController {
        let alertController = UIAlertController(
            title: "Error",
            message: error,
            preferredStyle: .alert)
        let action = UIAlertAction(title: "Close",style: .cancel)
        alertController.addAction(action)
        return alertController
    }
    
    func subscribeObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    func unsubscribeObserver() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    @objc func leaveReviewButtonTapped(sender: UIButton) {
        reviewViewController?.presenter?.leaveReviewButtonTapped()
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue)
            .cgRectValue
            .size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .required
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .defaultHigh
            self.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .defaultHigh
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .required
            self.layoutIfNeeded()
        }
    }
    
    @objc func hideKeyboard() {
        scrollView.endEditing(true)
    }
}
