//
//  SignUpController.swift
//  GBShop
//
//  Created by Оксана Каменчук on 26.01.2023.
//

import UIKit

class SignUpController: UIViewController {
    let signUpLabel = UILabel(text: "Sign Up", font: .avenir30(), textColor: .white)
    let logoImageView = UIImageView(image: UIImage(systemName: "Logo"), contentMode: .scaleAspectFit)
    let nameLabel = UILabel(text: "Name", font: .avenir20(), textColor: .white)
    let nameTextField = UITextField(placeholder: "Введите имя и фамилию", textColor: .white, backgroundColor: .white, cornerRadius: 17.0, font: .avenir15())
    let emailLabel = UILabel(text: "Email", font: .avenir20(), textColor: .white)
    let emailTextField = UITextField(placeholder: "Введите email", textColor: .white, backgroundColor: .white, cornerRadius: 17.0, font: .avenir15())
    let passwordLabel = UILabel(text: "Password", font: .avenir20(), textColor: .white)
    let passwordTextField = UITextField(placeholder: "Не менее 8 символов", textColor: .white, backgroundColor: .white, cornerRadius: 17.0, font: .avenir15())
    let signUpButton = UIButton(title: "SIGN UP", titleColor: .darkGray, backgroundColor: .systemYellow, font: .avenir15(), isShadow: true, cornerRadius: 17.0)
    let goToSignInButton = UIButton(title: "Sign In", titleColor: .systemYellow, backgroundColor: .darkGray, font: .avenir20(), cornerRadius: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setupConstraints()
        nameTextField.setLeftPaddingPoints(15)
        emailTextField.setLeftPaddingPoints(15)
        passwordTextField.setLeftPaddingPoints(15)
    
        goToSignInButton.addTarget(self, action: #selector(goToAuthController), for: .touchUpInside)
    }
    @objc func goToAuthController () {
        let vc = AuthViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    private func setupConstraints() {
        let nameView = LabelAndFieldView(label: nameLabel, textField: nameTextField)
        let emailView = LabelAndFieldView(label: emailLabel, textField: emailTextField)
        let passwordView = LabelAndFieldView(label: passwordLabel, textField: passwordTextField)
        let stackView = UIStackView(arrangedSubviews: [nameView, emailView, passwordView])
        stackView.axis = .vertical
        stackView.spacing = 35
        
        view.addSubview(logoImageView)
        view.addSubview(signUpLabel)
        view.addSubview(stackView)
        view.addSubview(signUpButton)
        view.addSubview(goToSignInButton)

        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        goToSignInButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 53),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 63),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
            
            goToSignInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 30),
            goToSignInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            goToSignInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            goToSignInButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
