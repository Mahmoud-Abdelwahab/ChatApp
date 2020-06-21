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
    
    var messagesList = [Message]()
    let dataBaseRef : DatabaseReference!
    var chatRoomPresenterRef : IChatRoomPresenter!
    init(chatRoomPresenterRef : IChatRoomPresenter) {
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
            guard let sID = Auth.auth().currentUser?.uid else{return}
            let dataArray : [String : Any] = ["senderId":sID ,"senderName" : userName , "text" : message ]
            
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
    
    
    
    
    
    
    //***** * **** **** * * Observing Messsage list Logic **************//
    
    
    func observingMessages(roomID: String ) {
        dataBaseRef.child("rooms").child(roomID).child("messages").observe(.childAdded) { (snapshot) in
            print(snapshot)
            
            if let message = snapshot.value as? [String : Any]
            {
                guard let senderName = message["senderName"] as? String , let messageText = message["text"] as? String ,  let UID = message["senderId"] as? String
                    else{
                        ///  no data
                        print("No Messages Found ... ")
                        return
                        
                }
                
                
                
                self.messagesList.append(Message(messageKey: snapshot.key, senderName: senderName, messageText: messageText, senderID: UID))
                self.chatRoomPresenterRef.onReceiveMessageList(messagesList: self.messagesList)
                
            } else{
                ///  no data
                print("No Messages Found ... ")
            }
            
        }
    }
    
}
