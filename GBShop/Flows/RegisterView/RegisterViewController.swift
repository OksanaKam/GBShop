//
//  RegisterViewController.swift
//  GBShop
//
//  Created by Оксана Каменчук on 10.01.2023.
//

import UIKit

protocol RegisterViewInput: AnyObject {
    func showAlertController(with title: String, error: String)
    func startShowingActivityIndicator()
    func stopShowingActivityIndicator()
}

final class RegisterViewController: UIViewController {
    
    private var registrartionView: RegisterView {
        guard let view = self.view as? RegisterView else {
            let correctView = RegisterView(frame: self.view.frame)
            self.view = correctView
            return correctView
        }
        return view
    }
    
    var presenter: RegisterViewOutput?
    
    override func loadView() {
        super.loadView()
        self.view = RegisterView(frame: self.view.frame)
        registrartionView.regViewController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrartionView.creditCardTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registrartionView.subscribeObserver()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.registrartionView.unsubscribeObserver()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Methods
    
    func presentAlert(title: String, error: String) -> UIAlertController {
        let alertController = UIAlertController(
            title: title,
            message: error,
            preferredStyle: .alert)
        
        let actionForError = UIAlertAction(title: "Close",style: .cancel)
        let actionOK = UIAlertAction(title: "OK", style: .cancel) { [weak self] _ in
            self?.presenter?.goToLogin()
        }
        if title != "Error" {
            alertController.addAction(actionOK)
        } else {
            alertController.addAction(actionForError)
        }
        
        return alertController
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard
            let boolForDelegate = presenter?.textFieldDelegate(textField, shouldChangeCharactersIn: range, replacementString: string)
        else {
            return false
        }
        return boolForDelegate
    }
}

extension RegisterViewController: RegisterViewInput {
    func showAlertController(with title: String, error: String) {
        DispatchQueue.main.async {
            self.present(self.presentAlert(title: title, error: error), animated: true)
        }
    }
    
    func startShowingActivityIndicator() {
        DispatchQueue.main.async {
            self.registrartionView.activityIndicator.startAnimating()
        }
    }
    
    func stopShowingActivityIndicator() {
        DispatchQueue.main.async {
            self.registrartionView.activityIndicator.stopAnimating()
        }
    }
}
