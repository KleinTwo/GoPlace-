//
//  HomeController.swift
//  MyProyecto
//
//  Created by LookyAR on 11/10/21.
//

import UIKit
import FirebaseAuth

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func clickCloseSesion(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.navigationController?.popToRootViewController(animated: true)
        } catch {
            print("Error al cerrar sesion")
        }
    }


}
