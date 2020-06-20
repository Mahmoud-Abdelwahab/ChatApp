//
//  MainChatRoomVC.swift
//  ChatApp
//
//  Created by kasper on 6/18/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import UIKit
import Firebase
class MainChatRoomVC: UIViewController {
    var formScreen : FormScreenVC?
  
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser?.uid == nil{
//            navigationController?.pushViewController(formScreen!, animated: true)

            self.formScreen?.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
            self.present(formScreen! , animated:  true , completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 formScreen = self.storyboard?.instantiateViewController(withIdentifier: "formScreen") as! FormScreenVC
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
    
    
    @IBAction func didPressLogout(_ sender: Any) {
         
         do {
             try Auth.auth().signOut()
         } catch let signOutError as NSError {
           print ("Error signing out: %@", signOutError)
         }
         
       
          
        self.formScreen?.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(formScreen! , animated:  true , completion: nil)
         
     }

}
