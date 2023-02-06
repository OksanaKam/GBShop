//
//  AuthView.swift
//  GBShop
//
//  Created by Оксана Каменчук on 24.01.2023.
//

import UIKit

final class AuthView: UIView {
    
    //MARK: Private properties
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
        view.accessibilityIdentifier = "appView"
        return view
    }()
    
    private var contentSize: CGSize {
        CGSize(width: frame.size.width, height: frame.size.height + 10)
    }
    
    private(set) lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "handbag")
        imageView.tintColor = UIColor(red: 241/255, green: 60/255, blue: 32/255, alpha: 1.0)
        return imageView
    }()
    
    private(set) lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 0.1
        textField.layer.cornerRadius = 5
        textField.placeholder = "Введите логин"
        textField.accessibilityIdentifier = "login"
        return textField
    }()
    
    private(set) lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 0.1
        textField.layer.cornerRadius = 5
        textField.placeholder = "Введите пароль"
        textField.accessibilityIdentifier = "password"
        return textField
    }()
    
    private(set) lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(UIColor(red: 64/255, green: 86/255, blue: 161/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        button .accessibilityIdentifier = "registrationButton"
        return button
    }()
    
    private(set) lazy var loginButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.setTitle("Login", for: .normal)
        button.layer.borderWidth = 0.2
        button.backgroundColor = UIColor(red: 64/255, green: 86/255, blue: 161/255, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button .accessibilityIdentifier = "loginButton"
        return button
    }()
   
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.backgroundColor = .lightGray
        return activityIndicator
    }()
    
    //MARK: Properties
    weak var authViewController: AuthViewController?
    
    //MARK: Init
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
        addLogoImage()
        addUserNameLabel()
        addUserNameTextField()
        addPasswordLabel()
        addPasswordTextField()
        addLoginButton()
        addRegistrationButton()
        addActivityIndicator()
    }
    
    private func addLogoImage() {
        contentView.addSubview(logoImage)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 150),
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func addUserNameLabel() {
        contentView.addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor,constant: 30),
            userNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func addUserNameTextField() {
        contentView.addSubview(userNameTextField)
        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor,constant: 10),
            userNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            userNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            userNameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addPasswordLabel() {
        contentView.addSubview(passwordLabel)
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 30),
            passwordLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func addPasswordTextField() {
        contentView.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor,constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addLoginButton() {
        contentView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
        ])
    }
    
    private func addRegistrationButton() {
        contentView.addSubview(registrationButton)
        
        NSLayoutConstraint.activate([
            registrationButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -150),
            registrationButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            registrationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            registrationButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addActivityIndicator() {
        contentView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
    }

    //MARK: Methods
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
    
    @objc func loginButtonTapped(sender: UIButton) {
        userNameTextField.text!.isEmpty ? CrashlyticsService.shared.sendReport(action: .correctLogin) : CrashlyticsService.shared.sendReport(action: .incorrectLogin)
        guard
            let login = userNameTextField.text,
            let password = passwordTextField.text
        else { return }
        authViewController?.presenter?.loginButtonTapped(login: login, password: password)
    }
    
    @objc func registrationButtonTapped(sender: UIButton) {
        authViewController?.presenter?.registrationButtonTapped()
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

