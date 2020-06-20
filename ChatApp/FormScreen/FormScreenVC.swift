//
//  ViewController.swift
//  ChatApp
//
//  Created by kasper on 6/18/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import UIKit
import Firebase
class FormScreenVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    
    var formPresenter : FormScreenPresenter?
    
    @IBOutlet weak var formCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formCollectionView.delegate = self
        formCollectionView.dataSource = self
            formPresenter = FormScreenPresenter(formScreenViewRef: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.formCollectionView.dequeueReusableCell(withReuseIdentifier: "FormCell", for: indexPath) as! FormCell
        
        setUpCollectionView(formCell :cell , indexPath : indexPath)
        
        return cell
    }
    
    //UICollectionViewDelegateFlowLayout to change collectionview cell size
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size  // cell size = it's parent size which is collection view
    }
    
    
    
    
    func    setUpCollectionView(formCell :FormCell , indexPath : IndexPath){
        
        if indexPath.row == 0 // signIn
        {
            formCell.userNameView.isHidden = true
            formCell.signInBtnOutlite.setTitle(" SignUp 👉", for: .normal)
            formCell.signUpBtnOutlite.setTitle("Login", for: .normal)
            formCell.signInBtnOutlite.addTarget(self, action: #selector(slideToSignInCell(_:)), for: .touchUpInside)
            
            formCell.signUpBtnOutlite.addTarget(self, action: #selector(didPressSignIn(_:)), for: .touchUpInside)
            
        }else if (indexPath.row == 1){ /// sign Up cell
            formCell.userNameView.isHidden = false
            formCell.signInBtnOutlite.setTitle("👈 Login", for: .normal)
            formCell.signUpBtnOutlite.setTitle("SignUp", for: .normal)
            formCell.signInBtnOutlite.addTarget(self, action: #selector(slideToSignUpCell(_:)), for: .touchUpInside)
            
            formCell.signUpBtnOutlite.addTarget(self, action: #selector(didPressSignUp(_:)), for: .touchUpInside)
        }
    }
    
    @objc func slideToSignInCell(_ sender :UIButton) {
        let indexPath = IndexPath(row: 1, section: 0)
        self.formCollectionView.scrollToItem(at: indexPath, at: [.centeredHorizontally], animated: true)
    }
    
    /////
    
    @objc func slideToSignUpCell(_ sender :UIButton) {
        let indexPath = IndexPath(row: 0, section: 0)
        self.formCollectionView.scrollToItem(at: indexPath, at: [.centeredHorizontally], animated: true)
    }
    
    @objc func didPressSignUp( _ sender :UIButton){
        let indexPath = IndexPath(row: 1, section: 0)
        let cell = self.formCollectionView.cellForItem(at:indexPath ) as! FormCell
        
        
        guard let email = cell.emailField.text , let password = cell.passwordField.text ,let username = cell.userNameField.text , cell.userNameField.text != ""
            else{
                Alert.showSimpleAlert(title: "Alert", message: "Please Fill The Required Fields", viewRef: self)
                return
        }
        
        
    
        
        formPresenter?.createUser(email: email, password: password , username : username)
        
        
    }
    
    @objc func didPressSignIn( _ sender :UIButton){
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = self.formCollectionView.cellForItem(at:indexPath ) as! FormCell
        
        
        guard let email = cell.emailField.text , let password = cell.passwordField.text
            else{
                Alert.showSimpleAlert(title: "Alert", message: "Please Fill The Required Fields", viewRef: self)
                return
        }
        if email.isEmpty == true || password.isEmpty ==  true {
            Alert.showSimpleAlert(title: "Alert", message: "Please Fill The Required Fields", viewRef: self)
        }else {
                 formPresenter?.checkUser(email: email, password: password)
        }
        
   
        
    }
    
}

extension FormScreenVC : IFormScreenVC , IOkAlert ,IView{
    func onLoginSuccess() {
       // Alert.simpleOkAlert(title: "Alert", message: " Welcom Back ...", viewRef: self)
        
//
//        let alert = UIAlertController.init(title: "Alert", message: " Welcom Back ...", preferredStyle: .alert)
//        let dismissButton = UIAlertAction.init(title: "Dismiss", style: .default, handler: nil)
//        alert.addAction(dismissButton)
//        self.present(alert,animated: true){
//            //  self.dismiss(animated: true, completion: nil)
//        }
        
    self.dismiss(animated: true, completion: nil)
      
        
    }
    
    
    
    func onSuccess() {
//        Alert.simpleOkAlert(title: "Alert", message: "Your Account has been created successfully .", viewRef: self)
         self.dismiss(animated: true, completion: nil)
    }
    
    func onFail(message: String) {
        
        Alert.showSimpleAlert(title: "Alert", message: "Sorry something went wrong ...", viewRef: self)
    }
    
    func onOkClicked() {
        
        // after creating accouint successfully go back to main chat .
        //.....
        //  self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    
}
