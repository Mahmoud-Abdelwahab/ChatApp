//
//  Alert.swift
//  ChatApp
//
//  Created by kasper on 6/19/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import UIKit
struct Alert {
    static func showSimpleAlert(title: String,message: String, viewRef: IView){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
//        alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor : UIColor.red]), forKey: "attributedTitle")

        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        viewRef.present(alert, animated: true, completion: nil)
//        alert.view.tintColor = UIColor.red
    }
//    func showConfirmBox(msg:String, title:String,
//    firstBtnStr:String, firstSelector:(sampleParameter: String) -> returntype,
//    secondBtnStr:String, secondSelector:() -> returntype,
//    caller:UIViewController) {
//    //Your Code
//}
    static func showAdvancedAlert(title: String ,message: String, viewAdvancedAlertRef: IViewAdvancedAlert){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

            

              viewAdvancedAlertRef.present(alert, animated: true)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                  print("You choosed Yes !")
                viewAdvancedAlertRef.pressOk()

              }))
              alert.addAction(UIAlertAction(title: "No", style: .default, handler: { action in
//                        print("You choosed NOoOo !")
                viewAdvancedAlertRef.pressCancel()
                    }))
        }
    
    

            static func simpleOkAlert(title: String,message: String, viewRef: IOkAlert){
                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        //        alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor : UIColor.red]), forKey: "attributedTitle")

    //            alert.addAction(UIAlertAction(title: "Ok".localized, style: UIAlertAction.Style.cancel, handler: nil))
                viewRef.present(alert, animated: true, completion: nil)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                                print("You choosed Yes !")
                              viewRef.onOkClicked()

                            }))
        //        alert.view.tintColor = UIColor.red
            }
}
