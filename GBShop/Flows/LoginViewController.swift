//
//  LoginViewController.swift
//  GBShop
//
//  Created by Оксана Каменчук on 10.01.2023.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var nameApp: UILabel!
    @IBOutlet var login: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var enter: UIButton!
    @IBOutlet var register: UIButton!
    
    @IBAction func enterPush(_ sender: Any) {
        print("пользователь нажал на кнопку")
       
    }
    
    @IBAction func registerPush(_ sender: Any) {
        print("пользователь нажал на кнопку")
        
        let registerViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
                self.present(registerViewController, animated: true, completion: nil)
    }
    
    let requestFactory = RequestFactory()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .init(red: 9, green: 207, blue: 255, alpha: 255)
        nameApp.text = "GBShop"
        enter.setTitle("Войти", for: .normal)
        register.setTitle("Регистрация", for: .normal)
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideScreen))
        view.addGestureRecognizer(tapGR)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    }
    
    @objc func willShowKeyboard(_ notification: Notification) {
        
        guard let info = notification.userInfo as NSDictionary?,
              let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {return}
        
        let keyBoardHeight = keyboardSize.cgRectValue.size.height
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyBoardHeight, right: 0)
    }
    
    @objc func willHideKeyboard(_ notification: Notification) {
        print(#function)
        
        guard let info = notification.userInfo as NSDictionary?,
              let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {return}
        
        let keyBoardHeight = keyboardSize.cgRectValue.size.height
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -keyBoardHeight, right: 0)
    }
    
    @objc func hideScreen() {
        view.endEditing(true)
        
    }
    
    private func setMainScreen() {
        let mainScreen = self.storyboard?.instantiateViewController(withIdentifier: "BasicViewController") as! BasicViewController
        navigationController?.pushViewController(mainScreen, animated: true)
    }
    
}
