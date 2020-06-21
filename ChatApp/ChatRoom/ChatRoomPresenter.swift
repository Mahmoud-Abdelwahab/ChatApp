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
    
    init(chatRoomModelRef :IChatRoomVC!) {
        self.chatRoomModelRef = chatRoomModelRef
    }
    
    
    func saveMessage(userId: String , message : String , roomId : String)
    {
        let chatRoomModel = ChatRoomModel(chatRoomPresenterRef: self)
        chatRoomModel.saveChatMessage(userId: userId, message: message, roomId: roomId)
    }
    
    func onMessageSaved()
    {
        chatRoomModelRef.onSuccess()
    }
    
    
}
