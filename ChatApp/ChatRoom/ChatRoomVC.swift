//
//  ChatRoomVC.swift
//  ChatApp
//
//  Created by kasper on 6/20/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import UIKit
import Firebase
class ChatRoomVC: UIViewController , IChatRoomVC , UITableViewDelegate , UITableViewDataSource {
  
    func onReceiveMessageList(messagesList: [Message]) {
        self.messagesList = messagesList
        chatRoomTable.reloadData()
    }
    
    
    
    var messagesList:[Message] = []
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = chatRoomTable.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageCell
        
    
        if let UID = Auth.auth().currentUser?.uid {
        if messagesList[indexPath.row].senderID == UID
        {
                cell.setBubbleType(type: .outgoing)
        }else{
            cell.setBubbleType(type: .incoming)
            }
        }
        
        cell.userNameText.text = messagesList[indexPath.row].senderName
        
        cell.messageField.text = messagesList[indexPath.row].messageText
         
        return cell
    }
    
    
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
        
        
        self.chatRoomTable.dataSource = self
        self.chatRoomTable.delegate = self
        self.chatRoomTable.separatorStyle = .none  // clear separators
        self.chatRoomTable.allowsSelection = false
        guard let roomID = room?.roomID else {
            
            return
       
        }
        
        chatRoomPresenter.observeMessages(roomID:roomID)
    }

}
