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
    func onRoomsReceived(roomsList :[Room])
}


protocol IChatRoomPresenter {
    func createNewRoom(roomName : String)
    func onRoomCreated()
    func onCreatingRoomFail()
    
    
    //*************//
    func roomObserver()
    
    func onRecieveFirebaseRooms(roomsList :[Room])
    
    
}
protocol IChatRoomModel {
    func createRoom(roomName : String)
    
    //*** ** * * ****  //
    func roomObserver()
}



