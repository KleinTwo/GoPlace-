//
//  Teclado.swift
//  MyProyecto
//
//  Created by LookyAR on 10/4/21.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth
import Firebase

class LoginController:UIViewController
{
      //Firebase
    
    @IBOutlet weak var EmailTExtField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var anchorBottomScroll: NSLayoutConstraint!
    
    @IBAction func LoginAction(_ sender: Any) {
        if let email = EmailTExtField.text, let password = PasswordTextField .text{
            Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "HomeController", sender: nil)
                }else{
                    let alertController = UIAlertController(title: "Error", message:error?.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }            
        }
    }

    @IBAction func goToRegistro(_ sender: Any){
        self.performSegue(withIdentifier: "RegistroController", sender: nil)
    }
    
    @IBAction func goToForgotPasswd(_ sender: Any){
        self.performSegue(withIdentifier: "RecuperacionController", sender: nil)
    }
    
    override  func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardEvent()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    @IBAction func TapTocloseKEyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
}


extension LoginController
{
    private func  registerKeyboardEvent ()
    {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyBoardWillShow(_:)), name:  UIResponder.keyboardWillShowNotification,  object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object:  nil)
    }
    private func unRegisterKeyboardEvent(){
        NotificationCenter.default.removeObserver(self)
        
    }
    @objc func keyBoardWillShow (_ notification: Notification)  {
        let keyboardFrame = notification.userInfo? [UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        UIKit.UIView.animate(withDuration: animationDuration)
        {
           self.anchorBottomScroll.constant=keyboardFrame.size.height
           self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyBoardWillHide (_ notification: Notification)  {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        UIView.animate(withDuration: animationDuration){
     
      self.view.layoutIfNeeded()
        
    }
}
}
