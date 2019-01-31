//
//  ViewController.swift
//  module demo
//
//  Created by Jacob Just on 31/01/2019.
//  Copyright © 2019 Jacob Just. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    private lazy var inputUserName = UITextField()
    private lazy var inputPassword = UITextField()
    private lazy var buttonLogin = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topView = UIView()
        
        view.addSubview(topView)
        
        topView.margin(left: 0, top: 0, right: 0, bottom: 0)
        topView.backgroundColor = UIColor.white
 
        topView.addSubview(inputUserName)
        topView.addSubview(inputPassword)
        topView.addSubview(buttonLogin)
        
        inputUserName.marginLeft(40).marginRight(-40).marginTop(100)
        inputPassword.marginLeft(40).marginRight(-40).marginTopFromView(margin: 40, view: inputUserName)
 
        inputUserName.textColor = Colors.widgetDarkGrey
        inputUserName.borderStyle = .roundedRect
        inputUserName.backgroundColor = Colors.widgetLightGrey
        inputUserName.delegate = self
        inputUserName.returnKeyType = .done
        
        inputPassword.textColor = Colors.widgetDarkGrey
        inputPassword.borderStyle = .roundedRect
        inputPassword.backgroundColor = Colors.widgetLightGrey
        inputPassword.delegate = self
        inputPassword.returnKeyType = .done
        inputPassword.isSecureTextEntry = true

        buttonLogin.setWidth(120).anchorCenterXToSuperview().marginTopFromView(margin: 40, view: inputPassword)
        
        inputUserName.placeholder = "Enter username"
        inputPassword.placeholder = "Enter password"
        buttonLogin.setTitle("LOGIN", for: .normal)
        buttonLogin.setTitleColor(UIColor.blue, for: .normal)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.endEditing(true)
        
        return true
    }

}

