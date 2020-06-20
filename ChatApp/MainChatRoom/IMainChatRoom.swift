//
//  IMainChatRoom.swift
//  ChatApp
//
//  Created by kasper on 6/18/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import Foundation



protocol IMainChatRoomVC {
    func onSuccess()
    func onFail()
    //*************//
    func onRoomsReceived(roomsList :[Room])
}


protocol IMainChatRoomPresenter {
    func createNewRoom(roomName : String)
    func onRoomCreated()
    func onCreatingRoomFail()
    
    
    //*************//
    func roomObserver()
    
    func onRecieveFirebaseRooms(roomsList :[Room])
    
    
}
protocol IMainChatRoomModel {
    func createRoom(roomName : String)
    
    //*** ** * * ****  //
    func roomObserver()
}



