//
//  RecuperacionController.swift
//  MyProyecto
//
//  Created by LookyAR on 11/10/21.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth
import Firebase

class RecuperacionController: UIViewController {
    
    @IBOutlet weak var EmailReestablecer: UITextField!
    
    @IBAction func ReestablecerContraseña(_ sender: Any) {
        let auth =  Auth.auth()
        auth.sendPasswordReset(withEmail: EmailReestablecer.text!) { (error) in
            if let error = error {
                let alertController = UIAlertController(title: "Error", message:error.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
            }else{
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
