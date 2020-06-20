//
//  IFormScreen.swift
//  ChatApp
//
//  Created by kasper on 6/19/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import Foundation


protocol IFormScreenVC  {
    func onSuccess ()
   func onFail(message: String)
    
      func onLoginSuccess ()
    
}
protocol IFormScreenPresenter {
    func createUser(email: String,password: String ,username : String)
   
    func onSuccessPresenter()
    func onFailPresenter(message: String)
    
      func checkUser(email: String,password: String )
        func onLoginSuccessPresenter()
}
protocol IFormScreenModel {
    func createNewUser(email: String,password: String ,userName: String)
     func checkUserExsistance(email: String,password: String )
}

