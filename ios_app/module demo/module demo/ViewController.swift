//
//  ViewController.swift
//  module demo
//
//  Created by Jacob Just on 31/01/2019.
//  Copyright © 2019 Jacob Just. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var inputUserName = UITextField()
    private lazy var inputPassword = UITextField()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topView = UIView()
        
        view.addSubview(topView)
        
        topView.margin(left: 0, top: 0, right: 0, bottom: 0)
        topView.backgroundColor = UIColor.white
 
        topView.addSubview(inputUserName)
        topView.addSubview(inputPassword)
        
        inputUserName.marginLeft(40).marginRight(40).marginTop(100)
        inputPassword.marginLeft(40).marginRight(40).marginTopFromView(margin: 40, view: inputUserName)
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

