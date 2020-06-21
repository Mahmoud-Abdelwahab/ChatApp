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
    let dataBaseRef : DatabaseReference!
    var chatRoomPresenterRef : IChatRoomPresenter!
    init(chatRoomPresenterRef : IChatRoomPresenter!) {
        self.chatRoomPresenterRef = chatRoomPresenterRef
        
        self.dataBaseRef = Database.database().reference()
    }
    
    func saveChatMessage(userId: String, message: String, roomId : String) {
        
        sendMessage(userId: userId, message: message, roomId: roomId) { (isSuccess) in
            if isSuccess
            {
                print("successfully saved")
                self.chatRoomPresenterRef.onMessageSaved()
            }else {
                print("failed to save")
            }
        }
    }
    
    
    func sendMessage(userId: String, message: String, roomId : String, completion: @escaping (_ isSuccess : Bool)->()) {
        
        getUserNameWithId(userId: userId)
        { (userName) in
            // this where we recive closue data first i sent userId to sendMssage then  when it fiished it return the value here in userName
            // check if username is nill
            guard let userName = userName , userName.isEmpty == false else {return} // creat var useName if userName is not equal nill  and not eamplty also
            // here save message in Room Directly
            let room =  self.dataBaseRef.child("rooms").child(roomId)
            
            let dataArray : [String : Any] = ["senderName" : userName , "text" : message]
            
            room.child("messages").childByAutoId().setValue(dataArray) { (error, referance) in
                
                if error == nil {
                    print("Message Saved Successfully")
                    completion(true) // typed true directly without mention isSuccess
                    /// because i put  ( _ ) before isSuccess var this mean you can access it without mentioning it's name
                }else{
                    completion(false)
                }
            }
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    func getUserNameWithId(userId :String , MyComplition : @escaping (_ userName : String?)->())  {
        
        
        let user = dataBaseRef.child("Users").child(userId)
        
        user.child("UserName").observeSingleEvent(of: .value) { (snapshot) in
            guard let userName = snapshot.value as? String else {
                MyComplition(nil)
                return
                
            }
            
            // here is get userName return it in compltion block
            MyComplition(userName)
        }
        
    }
    
}
