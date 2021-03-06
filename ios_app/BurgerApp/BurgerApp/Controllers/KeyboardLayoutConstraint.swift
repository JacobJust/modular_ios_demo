// The MIT License (MIT)
//
// Copyright (c) 2015 James Tang (j@jamztang.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

open class KeyboardLayoutConstraint: NSLayoutConstraint {
    
    private var offset : CGFloat = 0
    private var keyboardVisibleHeight : CGFloat = 0
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        offset = constant
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Notification
    
    @objc func keyboardWillShowNotification(_ notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            if let frameValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {
                let frame = frameValue.cgRectValue
                if #available(iOS 11.0, *) {
                    let window = UIApplication.shared.keyWindow
                    keyboardVisibleHeight = frame.size.height - (window?.safeAreaInsets.bottom ?? 0.0)
                } else {
                    keyboardVisibleHeight = frame.size.height
                }
            }
            
            self.updateConstant()
            switch (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber, userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber) {
            case let (.some(duration), .some(curve)):
                
                let options = UIViewAnimationOptions(rawValue: curve.uintValue)
                
                UIView.animate(
                    withDuration: TimeInterval(duration.doubleValue),
                    delay: 0.1,
                    options: options,
                    animations: {
                        self.layoutViews()
                        return
                }, completion: { finished in
                })
            default:
                
                break
            }
            
        }
        
    }
    
    @objc func keyboardWillHideNotification(_ notification: Notification) {
        keyboardVisibleHeight = 0
        self.updateConstant()
        
        if let userInfo = (notification as NSNotification).userInfo {
            
            switch (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber, userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber) {
            case let (.some(duration), .some(curve)):
                
                let options = UIViewAnimationOptions(rawValue: curve.uintValue)
                
                UIView.animate(
                    withDuration: TimeInterval(duration.doubleValue),
                    delay: 0.1,
                    options: options,
                    animations: {
                        self.layoutViews()
                        return
                }, completion: { finished in
                })
            default:
                break
            }
        }
    }
    
    func layoutViews() {
        for item in [firstItem, secondItem] {
            if let view = item as? UIView {
                view.layoutIfNeeded()
            }
            else if #available(iOS 9.0, *), let layoutGuide = item as? UILayoutGuide {
                layoutGuide.owningView?.layoutIfNeeded()
            }
        }
    }
    
    func updateConstant() {
        self.constant = offset + keyboardVisibleHeight
    }
    
}
