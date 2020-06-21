//
//  MainChatRoomModel.swift
//  ChatApp
//
//  Created by kasper on 6/18/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import Foundation

import Firebase
class MainChatRoomModel : IMainChatRoomModel{
    var   dataBaseRef :DatabaseReference?
    
    var mainChatPrsenter : IMainChatRoomPresenter!
    
    var roomList: [Room]=[]
    init(mainChatPresenter : IMainChatRoomPresenter) {
        
        self.mainChatPrsenter = mainChatPresenter
        
        
        dataBaseRef = Database.database().reference()
    }
    
    
    
    
    func createRoom(roomName: String) {
        
        
        let room = dataBaseRef!.child("rooms").childByAutoId()
        
        let dataArray :[String : Any] = [ "userID" :Auth.auth().currentUser?.uid  , "roomName" : roomName]
        room.setValue(dataArray) { (error, result) in
            if error == nil {
                // go back to emplty textField from here
                self.mainChatPrsenter.onRoomCreated()
            }else{
                
                self.mainChatPrsenter.onCreatingRoomFail()
            }
        }
        
        
        
        
    }
    
    
    
    
    
    func roomObserver() {
         
      //  var count = 0
        dataBaseRef!.child("rooms").observe(.childAdded) { (snapShot) in
            
            print(snapShot)
            
            guard let data = snapShot.value as? Dictionary<String , Any> else { return }
            
              print(data["userID"])
            
           
            self.roomList.append(Room(userID: data["userID"] as! String, roomName: data["roomName"] as! String, roomID:snapShot.key ))
            
           // count = count + 1
            
            self.mainChatPrsenter.onRecieveFirebaseRooms(roomsList: self.roomList)
        }
        
       
        
    }
    
    
}
