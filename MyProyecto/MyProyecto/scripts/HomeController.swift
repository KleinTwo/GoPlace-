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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
