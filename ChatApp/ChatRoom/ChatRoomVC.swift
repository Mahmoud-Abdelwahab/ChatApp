//
//  ChatRoomVC.swift
//  ChatApp
//
//  Created by kasper on 6/20/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import UIKit

class ChatRoomVC: UIViewController {
  
    @IBOutlet weak var chatRoomTable: UITableView!
    var room : Room?
    @IBOutlet weak var messageFeild: UITextField!
    @IBAction func sendBtn(_ sender: Any) {
        guard  let chatText = self.messageFeild.text , chatText.isEmpty == false else {
            return
        }

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
