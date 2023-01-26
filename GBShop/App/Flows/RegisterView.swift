//
//  RegisterView.swift
//  GBShop
//
//  Created by Оксана Каменчук on 24.01.2023.
//

import UIKit

final class RegisterView: UIView {
    
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
        return view
    }()
    
    private var contentSize: CGSize {
        CGSize(width: frame.size.width, height: frame.size.height + 40)
    }
    
    private(set) lazy var registrationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Registration"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor(red: 241/255, green: 60/255, blue: 32/255, alpha: 1.0)
        return label
    }()
    
    private(set) lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 0.1
        textField.layer.cornerRadius = 5
        
        return textField
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
        return textField
    }()
    
    private(set) lazy var secondPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Repeat password:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var secondPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 0.1
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private(set) lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gender:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var genderButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Male", for: .normal)
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 5
        button.tintColor = .black
        return button
    }()
    
    private(set) lazy var creditCardLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Credit card:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var creditCardTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.layer.borderWidth = 0.1
        textField.layer.cornerRadius = 5
        return textField
    }()

    private(set) lazy var signUpButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.setTitle("Sign Up", for: .normal)
        button.layer.borderWidth = 0.2
        button.backgroundColor = UIColor(red: 64/255, green: 86/255, blue: 161/255, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.backgroundColor = .lightGray
        return activityIndicator
    }()
    
    //MARK: Properties
    weak var regViewController: RegisterViewController?
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPullDownMenu()
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private methods
    private func configureUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        addRegistrationLabel()
        addEmailLabel()
        addEmailTextField()
        addUserNameLabel()
        addUserNameTextField()
        addPasswordLabel()
        addPasswordTextField()
        addSecondPasswordLabel()
        addSecondPasswordTextField()
        addGenderLabel()
        addGenderButton()
        addCreditCardLabel()
        addCreditCardTextField()
        addSignUpButton()
        addActivityIndicator()
    }
    
    private func setupPullDownMenu() {
        
        let genderClosure = { (action: UIAction) in
        }
        
        genderButton.menu = UIMenu(children: [
            UIAction(title: "Male", state: .on, handler:
                        genderClosure),
            UIAction(title: "Female", handler: genderClosure)
        ])
        
        genderButton.showsMenuAsPrimaryAction = true
        genderButton.changesSelectionAsPrimaryAction = true
    }
    
    private func addRegistrationLabel() {
        contentView.addSubview(registrationLabel)
        
        NSLayoutConstraint.activate([
            registrationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            registrationLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func addEmailLabel() {
        contentView.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 40)
        ])
    }
    
    private func addEmailTextField() {
        contentView.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addUserNameLabel() {
        contentView.addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 40)
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
            passwordLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 10),
            passwordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
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
    
    private func addSecondPasswordLabel() {
        contentView.addSubview(secondPasswordLabel)
        
        NSLayoutConstraint.activate([
            secondPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            secondPasswordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        ])
    }
    
    private func addSecondPasswordTextField() {
        contentView.addSubview(secondPasswordTextField)
        
        NSLayoutConstraint.activate([
            secondPasswordTextField.topAnchor.constraint(equalTo: secondPasswordLabel.bottomAnchor,constant: 10),
            secondPasswordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            secondPasswordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            secondPasswordTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addGenderLabel() {
        contentView.addSubview(genderLabel)
        
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: secondPasswordTextField.bottomAnchor, constant: 10),
            genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        ])
    }
    
    private func addGenderButton() {
        contentView.addSubview(genderButton)
        
        NSLayoutConstraint.activate([
            genderButton.topAnchor.constraint(equalTo: secondPasswordTextField.bottomAnchor, constant: 40),
            genderButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            genderButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            genderButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            genderButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addCreditCardLabel() {
        contentView.addSubview(creditCardLabel)
        
        NSLayoutConstraint.activate([
            creditCardLabel.topAnchor.constraint(equalTo: genderButton.bottomAnchor, constant: 10),
            creditCardLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        ])
    }
    
    private func addCreditCardTextField() {
        contentView.addSubview(creditCardTextField)
        
        NSLayoutConstraint.activate([
            creditCardTextField.topAnchor.constraint(equalTo: creditCardLabel.bottomAnchor,constant: 10),
            creditCardTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            creditCardTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            creditCardTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addSignUpButton() {
        contentView.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: creditCardTextField.bottomAnchor, constant: 15),
            signUpButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            signUpButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 150),
            signUpButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -150)
        ])
    }
    
    private func addActivityIndicator() {
        contentView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
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
    
    @objc func signUpButtonTapped(sender: UIButton) {
        guard
            let email = emailTextField.text,
                let userName = userNameTextField.text,
                let password = passwordTextField.text,
                let secondPassword = secondPasswordTextField.text,
                let creditCard = creditCardTextField.text
        else { return }
                let regUser = User(id: 123,
                                   userName: userName,
                                   password: password,
                                   name: userName,
                                   lastname: userName,
                                   email: email,
                                   creditCard: creditCard)
                regViewController?.presenter?.registrationButtonTapped(user: regUser, secondPassword: secondPassword)
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
