//
//  FormScreenModel.swift
//  ChatApp
//
//  Created by kasper on 6/19/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import Foundation
import Firebase
class FormScreenModel : IFormScreenModel {
  
   
    
    var formScreenPresenterlRef : IFormScreenPresenter!
   
      
      init(formScreenPresenterlRef : IFormScreenPresenter) {
          self.formScreenPresenterlRef = formScreenPresenterlRef
      }
    
    
    func createNewUser(email: String,password: String ,userName: String) {
       
        Auth.auth().createUser(withEmail: email, password: password ) { (result, error) in
            
            if error == nil{
                self.formScreenPresenterlRef.onSuccessPresenter()
                print(result)
                self.addNewUser(userName : userName)
                // user created Successfully no i want tot add  user to DB
            }else{
                self.formScreenPresenterlRef.onFailPresenter(message: error?.localizedDescription ?? "Something went wrong try again ...")
            }
            
        }
    }
    
    func addNewUser(userName : String){
         
        guard let userId = Auth.auth().currentUser?.uid else {return}
        let referance = Database.database().reference()
        let user = referance.child("Users").child(userId)
        let dataArray : [String : Any] = ["UserName" : userName]
        user.setValue(dataArray)
    }
    
    
    
       func checkUserExsistance(email: String, password: String) {
           Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
               if error == nil {
                self.formScreenPresenterlRef.onLoginSuccessPresenter()
               
                print(Auth.auth().currentUser?.uid)
               } else{
                self.formScreenPresenterlRef.onFailPresenter(message: error?.localizedDescription ?? "something went wrong ... ")
                   }
           }
    }
}
