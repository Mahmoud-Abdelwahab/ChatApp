//
//  ViewController.swift
//  ChatApp
//
//  Created by kasper on 6/18/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import UIKit

class FormScreenVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
 
    @IBOutlet weak var formCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formCollectionView.delegate = self
        formCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 2
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
          let cell = self.formCollectionView.dequeueReusableCell(withReuseIdentifier: "FormCell", for: indexPath) as! FormCell
          
          if indexPath.row == 0 // signIn
          {
            cell.userNameView.isHidden = true
            cell.signInBtnOutlite.setTitle(" SignUp 👉🏻", for: .normal)
            cell.signUpBtnOutlite.setTitle("Login", for: .normal)
            cell.signInBtnOutlite.addTarget(self, action: #selector(slideToSignInCell(_:)), for: .touchUpInside)
          }else if (indexPath.row == 1){ /// sign Up cell
             cell.userNameView.isHidden = false
            cell.signInBtnOutlite.setTitle("<-- Login", for: .normal)
                       cell.signUpBtnOutlite.setTitle("SignUp", for: .normal)
             cell.signInBtnOutlite.addTarget(self, action: #selector(slideToSignUpCell(_:)), for: .touchUpInside)
        }
          
          return cell
      }
      
      //UICollectionViewDelegateFlowLayout to change collectionview cell size
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return collectionView.frame.size  // cell size = it's parent size which is collection view
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


}

extension FormScreenVC {
  
    
    
}
