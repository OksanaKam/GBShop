//
//  UserView.swift
//  GBShop
//
//  Created by Оксана Каменчук on 12.01.2023.
//

import UIKit

final class UserView: UIView {
    
    //MARK: - Private properties
    
    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.frame = self.bounds
        scrollView.contentSize = contentSize
        scrollView.backgroundColor = .white
        scrollView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(hideKeyboard)))
        
        return scrollView
    }()
    
    private var canEdited = false
    
    private(set) lazy var contentView: UIView = {
        let view = UIView()
        view.frame.size = contentSize
        return view
    }()
    
    private var contentSize: CGSize {
        CGSize(width: frame.size.width, height: frame.size.height + 40)
    }
    
    private(set) lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profile"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .cyan
        return label
    }()
    
    private(set) lazy var avatarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .cyan
        return imageView
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
        textField.isUserInteractionEnabled = false
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
        textField.isUserInteractionEnabled = false
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
        textField.isUserInteractionEnabled = false
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
        button.isUserInteractionEnabled = false
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
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    private(set) lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bio:"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var bioTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 0.1
        textView.layer.cornerRadius = 5
        textView.isUserInteractionEnabled = false
        return textView
    }()
    
    private(set) lazy var conformButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.setTitle("Edit", for: .normal)
        button.layer.borderWidth = 0.2
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(conformButtonTapped), for: .touchUpInside)
        return button
    }()
    
    weak var userViewController: UserViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        addProfileLabel()
        addAvatarImageView()
        addEmailLabel()
        addEmailTextField()
        addUserNameLabel()
        addUserNameTextField()
        addPasswordLabel()
        addPasswordTextField()
        addGenderLabel()
        addGenderButton()
        addCreditCardLabel()
        addCreditCardTextField()
        addBioLabel()
        addBioTextView()
        addSignUpButton()
    }
    
    private func addProfileLabel() {
        contentView.addSubview(profileLabel)
        
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            profileLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func addAvatarImageView() {
        contentView.addSubview(avatarImage)
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 10),
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            avatarImage.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarImage.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func addEmailLabel() {
        contentView.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor,constant: 10)
        ])
    }
    
    private func addEmailTextField() {
        contentView.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor,constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addUserNameLabel() {
        contentView.addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor,constant: 10)
        ])
    }
    
    private func addUserNameTextField() {
        contentView.addSubview(userNameTextField)
        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor,constant: 10),
            userNameTextField.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor,constant: 10),
            userNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            userNameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addPasswordLabel() {
        contentView.addSubview(passwordLabel)
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 10),
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
    
    private func addGenderLabel() {
        contentView.addSubview(genderLabel)

        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        ])
    }
    
    private func addGenderButton() {
        contentView.addSubview(genderButton)
        
        NSLayoutConstraint.activate([
            genderButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
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
    
    private func addBioLabel() {
        contentView.addSubview(bioLabel)
        
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: creditCardTextField.bottomAnchor, constant: 10),
            bioLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40)
        ])
    }
    
    private func addBioTextView() {
        contentView.addSubview(bioTextView)
        
        NSLayoutConstraint.activate([
            bioTextView.topAnchor.constraint(equalTo: bioLabel.bottomAnchor,constant: 10),
            bioTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            bioTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            bioTextView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func addSignUpButton() {
        contentView.addSubview(conformButton)
        
        NSLayoutConstraint.activate([
            conformButton.topAnchor.constraint(equalTo: bioTextView.bottomAnchor, constant: 15),
            conformButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            conformButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 150),
            conformButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -150)
        ])
    }
    
    private func editedTextField(canEdited: Bool) {
        emailTextField.isUserInteractionEnabled = canEdited
        userNameTextField.isUserInteractionEnabled = canEdited
        passwordTextField.isUserInteractionEnabled = canEdited
        genderButton.isUserInteractionEnabled = canEdited
        creditCardTextField.isUserInteractionEnabled = canEdited
        bioTextView.isUserInteractionEnabled = canEdited
        if canEdited {
            conformButton.setTitle("Confirm", for: .normal)
        } else {
            conformButton.setTitle("Edit", for: .normal)
        }
    }
    
    //MARK: - Methods
    
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
    
    func showUserInfo(userInfo: User) {
        emailTextField.text = userInfo.email
        userNameTextField.text = userInfo.name
        passwordTextField.text = userInfo.password
        /*genderButton.setTitle(userInfo.gender, for: .normal)*/
        creditCardTextField.text = userInfo.creditCard
    }
    
    @objc func conformButtonTapped(sender: UIButton) {
        guard
            let email = emailTextField.text,
            let userName = userNameTextField.text,
            let password = passwordTextField.text,
            let creditCard = creditCardTextField.text
        else { return }
        if canEdited {
            canEdited = false
            let currentUser = User(id: UserSession.instance.user.id,
                                   login: userName,
                                   password: password,
                                   name: userName,
                                   lastname: userName,
                                   email: email,
                                   creditCard: creditCard)
            userViewController?.presenter?.changeUserInfo(userInfo: currentUser)
        } else {
            canEdited = true
        }
        editedTextField(canEdited: canEdited)
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
