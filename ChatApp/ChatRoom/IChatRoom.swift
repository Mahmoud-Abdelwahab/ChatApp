//
//  IChatRoom.swift
//  ChatApp
//
//  Created by kasper on 6/21/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import Foundation


protocol IChatRoomVC {
    func onSuccess()
    func onFail()
    //*************//
    
      func onReceiveMessageList(messagesList : [Message])
    
    
    }


protocol IChatRoomPresenter {
    func saveMessage(userId: String , message : String ,  roomId : String)
    
    func onMessageSaved()
    
    func observeMessages(roomID:String)
    
    func onReceiveMessageList(messagesList : [Message])
    
}
protocol IChatRoomModel {
    func saveChatMessage(userId: String , message : String,  roomId : String)
    
    func observingMessages(roomID : String)
    
}



