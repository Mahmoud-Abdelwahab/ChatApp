//
//  MainChatRoomVC.swift
//  ChatApp
//
//  Created by kasper on 6/18/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import UIKit
import Firebase
class MainChatRoomVC: UIViewController , UITableViewDelegate , UITableViewDataSource ,IMainChatRoomVC{
   
    var roomList : [Room] = [];
    
   func onRoomsReceived(roomsList: [Room]) {
       roomList = roomsList
    roomsTable.reloadData()
     }
    
    
    func onSuccess() {
     
        roomTextField.text  = ""
    }
    
    func onFail() {
        let alert = UIAlertController.init(title: "Alert", message: "Something Went Wrong !", preferredStyle: .alert)
        let dismissButton = UIAlertAction.init(title: "Dismiss", style: .default, handler: nil)
               alert.addAction(dismissButton)
               self.present(alert,animated: true){
                   //  self.dismiss(animated: true, completion: nil)
               }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = self.roomsTable.dequeueReusableCell(withIdentifier: "roomCell")!
        cell.textLabel?.text = roomList[indexPath.row].roomName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatRoom = self.storyboard?.instantiateViewController(withIdentifier: "ChatRoom") as! ChatRoomVC
        
        self.navigationController?.pushViewController(chatRoom, animated: true)
        
        
    }
    
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
