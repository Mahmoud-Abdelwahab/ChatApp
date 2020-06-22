//
//  ViewController.swift
//  ChatApp
//
//  Created by kasper on 6/18/20.
//  Copyright © 2020 Mahmoud.kasper.ChatApp. All rights reserved.
//

import UIKit
import Firebase
class FormScreenVC: UIViewController  {
    
    var formPresenter : FormScreenPresenter?
    
    @IBOutlet weak var formCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formCollectionView.delegate = self
        formCollectionView.dataSource = self
        formPresenter = FormScreenPresenter(formScreenViewRef: self)
    }
    
    
    
}

