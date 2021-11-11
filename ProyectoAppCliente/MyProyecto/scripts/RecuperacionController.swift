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


class RecuperacionController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
