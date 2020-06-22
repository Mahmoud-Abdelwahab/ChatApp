//
//  MainChatRoomVC+Extentions.swift
//  ChatApp
//
//  Created by kasper on 6/21/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import Foundation
import UIKit
extension MainChatRoomVC :   UITableViewDelegate , UITableViewDataSource ,IMainChatRoomVC
{
    
    func onRoomsReceived(roomsList: [Room]) {
        roomList = roomsList
        roomsTable.reloadData()
    }
    
    
    func onSuccess() {
        
        roomTextField.text  = ""
    }
    
    func onFail() {
        let alert = UIAlertController.init(title: "Alert", message: "Something Went Wrong !", preferredStyle: .alert)
        let dismissButton = UIAlertAction.init(title: "Dismiss", style: .default, handler: nil)
        alert.addAction(dismissButton)
        self.present(alert,animated: true){
            //  self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.roomsTable.dequeueReusableCell(withIdentifier: "roomCell")!
        cell.textLabel?.text = roomList[indexPath.row].roomName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatRoom = self.storyboard?.instantiateViewController(withIdentifier: "ChatRoom") as! ChatRoomVC
        
        let selectedRoom = self.roomList[indexPath.row]
        
        chatRoom.room = selectedRoom
        self.navigationController?.pushViewController(chatRoom, animated: true)
        
        
    }
    
}
