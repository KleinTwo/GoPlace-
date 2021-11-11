//
//  RegistroController.swift
//  MyProyecto
//
//  Created by LookyAR on 11/10/21.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth
import Firebase
import FirebaseFirestore

class RegistroController: UIViewController {    
    
    @IBOutlet weak var NombreRegistro: UITextField!
    @IBOutlet weak var ApellidoRegistro: UITextField!
    @IBOutlet weak var EmailRegistro: UITextField!
    @IBOutlet weak var TelefonoRegistro: UITextField!
    @IBOutlet weak var ContraseñaRegistro: UITextField!
    
    private let db = Firestore.firestore()
    
    @IBAction func RegisterAction(_ sender: Any) {
        if let email = EmailRegistro.text,
           let password = ContraseñaRegistro.text,
           let name = NombreRegistro.text,
           let lastname = ApellidoRegistro.text,
           let phone = TelefonoRegistro.text
        {
            Auth.auth().createUser(withEmail: email, password: password){
                (result, error) in
                if error == nil {
                    db.collection("drivers").document(email).setData([
                        "name": name,
                        "lastname": lastname,
                        "phone": phone
                    ])
                    self.navigationController?.popToRootViewController(animated: true)
                }else{
                    let alertController = UIAlertController(title: "Error", message:error?.localizedDescription, preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                        self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }

    @IBAction func clickCloseKeyboard(_ sender: Any){
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
