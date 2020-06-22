//
//  MainChatRoomVC.swift
//  ChatApp
//
//  Created by kasper on 6/18/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import UIKit
import Firebase
class MainChatRoomVC: UIViewController{
    
    var roomList : [Room] = [];
    
    
    
    @IBAction func CreateRoomBtn(_ sender: Any) {
        
        guard let roomName = roomTextField.text , roomName.isEmpty == false else {
            
            return
        }
        
        mainPresenterRef?.createNewRoom(roomName: roomName)
        
    }
    @IBOutlet weak var roomTextField: UITextField!
    
    @IBOutlet weak var roomsTable: UITableView!
    var formScreen : FormScreenVC?
    
    
    var mainPresenterRef : MainChatRoomPresenter?
    
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
        self.roomsTable.separatorStyle = .none  // clear separators
        
        
        mainPresenterRef = MainChatRoomPresenter( mainVCRef:self)
        
        self.observeRooms()
        
    }
    
    func  observeRooms() {
        mainPresenterRef!.roomObserver()
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
