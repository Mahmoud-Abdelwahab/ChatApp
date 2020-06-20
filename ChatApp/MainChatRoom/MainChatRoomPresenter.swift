//
//  MainChatRoomPresenter.swift
//  ChatApp
//
//  Created by kasper on 6/18/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import Foundation

class MainChatRoomPresenter : IMainChatRoomPresenter {
  
    
    
    
    var mainChatModelRef : MainChatRoomModel!
    var mainVCRef : IMainChatRoomVC!
    
    init( mainVCRef : IMainChatRoomVC) {
        self.mainVCRef = mainVCRef
              mainChatModelRef = MainChatRoomModel(mainChatPresenter: self)
    }
    
    func createNewRoom(roomName: String) {
   
        mainChatModelRef.createRoom(roomName: roomName)
    }
    
    func onRoomCreated() {
        mainVCRef.onSuccess()
    }
    
    func onCreatingRoomFail() {
         mainVCRef.onFail()
    }
    
     func roomObserver()
     {
       mainChatModelRef.roomObserver()
     }
    
   
    
    func onRecieveFirebaseRooms(roomsList: [Room]) {
           mainVCRef.onRoomsReceived(roomsList: roomsList)
      }
    
}
