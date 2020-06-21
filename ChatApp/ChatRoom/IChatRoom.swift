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
    }


protocol IChatRoomPresenter {
    func saveMessage(userId: String , message : String ,  roomId : String)
    
    func onMessageSaved()
}
protocol IChatRoomModel {
    func saveChatMessage(userId: String , message : String,  roomId : String)
}



