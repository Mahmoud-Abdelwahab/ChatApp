//
//  MessageCell.swift
//  ChatApp
//
//  Created by kasper on 6/21/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    enum bubbleType{
        case incoming
        case outgoing
    }
    
    @IBOutlet weak var chatTextBubble: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var messageField: UITextView!
    @IBOutlet weak var userNameText: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        chatTextBubble.layer.cornerRadius = 9
    }

    
    func setBubbleType(type:bubbleType)  {
        
        if type == .incoming
        {
            stackView.alignment = .leading
            chatTextBubble.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            messageField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }else if type == .outgoing {
             stackView.alignment = .trailing
            chatTextBubble.backgroundColor = #colorLiteral(red: 0.2005997582, green: 0.6044861711, blue: 0.8183692893, alpha: 1)
                messageField.textColor = #colorLiteral(red: 0.80113103, green: 0.8147794472, blue: 0.8183692893, alpha: 1)
        }
    }
    
}
