//
//  ChatRoomVC+Extentions.swift
//  ChatApp
//
//  Created by kasper on 6/22/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import UIKit
import Firebase
extension ChatRoomVC :  IChatRoomVC , UITableViewDelegate , UITableViewDataSource  {
    
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
    
    func onSuccess() {
          messageFeild.text = ""
      }
      
      func onFail() {
          
      }
    
    
    
       func onReceiveMessageList(messagesList: [Message]) {
           self.messagesList = messagesList
           chatRoomTable.reloadData()
       }
       
      
}
