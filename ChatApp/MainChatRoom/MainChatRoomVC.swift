//
//  MainChatRoomVC.swift
//  ChatApp
//
//  Created by kasper on 6/18/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import UIKit
import Firebase
class MainChatRoomVC: UIViewController , UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = self.roomsTable.dequeueReusableCell(withIdentifier: "roomCell")!
        cell.textLabel?.text = "Hello"
        
        return cell
    }
    
    
    
    @IBOutlet weak var roomsTable: UITableView!
    var formScreen : FormScreenVC?
    
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser?.uid == nil{
           
            self.formScreen?.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
            self.present(formScreen! , animated:  true , completion: nil)
        }
    }
    
    // ** ** * * * **  DidLoad *********** ** * *  */
    override func viewDidLoad() {
        super.viewDidLoad()
        formScreen = self.storyboard?.instantiateViewController(withIdentifier: "formScreen") as! FormScreenVC
        // Do any additional setup after loading the view.
        
        self.roomsTable.delegate = self
        self.roomsTable.dataSource = self
        
    }
    
  
    
    
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
