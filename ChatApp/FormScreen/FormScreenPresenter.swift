//
//  FormScreenPresenter.swift
//  ChatApp
//
//  Created by kasper on 6/19/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import Foundation

class FormScreenPresenter : IFormScreenPresenter {
    func onLoginSuccessPresenter() {
        formScreenViewRef.onLoginSuccess()
    }
    
   
    var formScreenViewRef : IFormScreenVC!
    var loginModel : FormScreenModel!
    
    init(formScreenViewRef : IFormScreenVC) {
                    loginModel = FormScreenModel(formScreenPresenterlRef: self)
        self.formScreenViewRef = formScreenViewRef
    }
    
    func createUser(email: String,password: String ,username : String) {
        loginModel.createNewUser(email: email, password: password ,userName : username)
        
        
    }
    
    func checkUser(email: String, password: String) {
        loginModel.checkUserExsistance(email: email, password: password)
       }
       
    
    func onSuccessPresenter() {
        formScreenViewRef.onSuccess()
    }
    
    func onFailPresenter(message: String) {
        formScreenViewRef.onFail(message: message)
    }
    
    
    
    
    
    
    
}
