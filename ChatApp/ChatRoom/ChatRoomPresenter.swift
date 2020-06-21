//
//  ChatRoomPresenter.swift
//  ChatApp
//
//  Created by kasper on 6/21/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import Foundation

class ChatRoomPresenter:IChatRoomPresenter {
    var chatRoomModelRef :IChatRoomVC!
    var chatRoomModel : ChatRoomModel!
       init(chatRoomModelRef :IChatRoomVC!) {
           self.chatRoomModelRef = chatRoomModelRef
        self.chatRoomModel = ChatRoomModel(chatRoomPresenterRef : self)
       }
       
    
    func observeMessages(roomID: String) {
        chatRoomModel.observingMessages(roomID : roomID)
    }
    
    func onReceiveMessageList(messagesList: [Message]) {
        chatRoomModelRef.onReceiveMessageList(messagesList: messagesList)
    }
    
    
   
    
    func saveMessage(userId: String , message : String , roomId : String)
    {
       
        chatRoomModel.saveChatMessage(userId: userId, message: message, roomId: roomId)
    }
    
    func onMessageSaved()
    {
        chatRoomModelRef.onSuccess()
    }
    
    
}
