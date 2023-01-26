//
//  AuthFormView.swift
//  GBShop
//
//  Created by Оксана Каменчук on 26.01.2023.
//

import UIKit

class AuthFormView: UIView {
    init (
        emailTextField: UITextField,
        passwordTextField: UITextField,
        authButton: UIButton,
        goToSignUpButton: UIButton
    ) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        authButton.translatesAutoresizingMaskIntoConstraints = false
        goToSignUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(authButton)
        self.addSubview(goToSignUpButton)
        emailTextField.setLeftPaddingPoints(15)
        passwordTextField.setLeftPaddingPoints(15)

        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: self.topAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 319),
            emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
     
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 319),
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
        
            authButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            authButton.widthAnchor.constraint(equalToConstant: 319),
            authButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            authButton.heightAnchor.constraint(equalToConstant: 45),
       
            goToSignUpButton.topAnchor.constraint(equalTo: authButton.bottomAnchor, constant: 25),
            goToSignUpButton.widthAnchor.constraint(equalToConstant: 319),
            goToSignUpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            goToSignUpButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        bottomAnchor.constraint(equalTo: authButton.bottomAnchor).isActive = true
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // разрешает пропускать через себя событик к subview
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews {
            if !subview.isHidden && subview.isUserInteractionEnabled && subview.point(inside: convert(point, to: subview), with: event) {
                return true
            }
        }
        return false
    }
}
