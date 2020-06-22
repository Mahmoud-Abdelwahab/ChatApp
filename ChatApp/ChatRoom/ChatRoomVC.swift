//
//  ChatRoomVC.swift
//  ChatApp
//
//  Created by kasper on 6/20/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import UIKit
import Firebase
class ChatRoomVC: UIViewController {
    
    var messagesList:[Message] = []
    
    var chatRoomPresenter : ChatRoomPresenter!
    
    @IBOutlet weak var chatRoomTable: UITableView!
    var room : Room?
    @IBOutlet weak var messageFeild: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        chatRoomPresenter = ChatRoomPresenter(chatRoomModelRef: self)
        
        
        self.chatRoomTable.dataSource = self
        self.chatRoomTable.delegate = self
        self.chatRoomTable.separatorStyle = .none  // clear separators
        self.chatRoomTable.allowsSelection = false
        guard let roomID = room?.roomID else {
            
            return
            
        }
        
        chatRoomPresenter.observeMessages(roomID:roomID)
    }
    
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
    
    
}
