//
//  ChatRoomModel.swift
//  ChatApp
//
//  Created by kasper on 6/21/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import Foundation
import Firebase
class ChatRoomModel : IChatRoomModel {
    
    var chatRoomPresenterRef : IChatRoomPresenter!
    init(chatRoomPresenterRef : IChatRoomPresenter!) {
        self.chatRoomPresenterRef = chatRoomPresenterRef
    }
    
    func saveChatMessage(userId: String, message: String, roomId : String) {
     
        let dataBaseRef = Database.database().reference()
        
        let user = dataBaseRef.child("Users").child(userId)
        
        user.child("UserName").observeSingleEvent(of: .value) { (snapshot) in
            
            guard let userName = snapshot.value as? String else {return}
             // here save message in Room Directly
          let room =  dataBaseRef.child("rooms").child(roomId)
            
            let dataArray : [String : Any] = ["senderName" : userName , "text" : message]
            
            room.child("messages").childByAutoId().setValue(dataArray) { (error, referance) in
                
                if error == nil {
                    print("Message Saved Successfully")
                    self.chatRoomPresenterRef.onMessageSaved()
                }
            }
            
            
        }
        
        
        
    }
    
    
}
