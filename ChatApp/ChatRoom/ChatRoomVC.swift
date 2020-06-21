//
//  ChatRoomVC.swift
//  ChatApp
//
//  Created by kasper on 6/20/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import UIKit
import Firebase
class ChatRoomVC: UIViewController , IChatRoomVC {
    
    var chatRoomPresenter : ChatRoomPresenter!
    func onSuccess() {
        messageFeild.text = ""
    }
    
    func onFail() {
        
    }
    
  
    @IBOutlet weak var chatRoomTable: UITableView!
    var room : Room?
    @IBOutlet weak var messageFeild: UITextField!
    @IBAction func sendBtn(_ sender: Any) {
        guard  let chatText = self.messageFeild.text , chatText.isEmpty == false , let userId = Auth.auth().currentUser?.uid else {
            return
        }
        // now i want to get username from users table
 // then save message in the room
        
        if let roomID = self.room?.roomID
        {
        chatRoomPresenter.saveMessage(userId: userId, message: chatText , roomId : roomID)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        chatRoomPresenter = ChatRoomPresenter(chatRoomModelRef: self)
    }

}
