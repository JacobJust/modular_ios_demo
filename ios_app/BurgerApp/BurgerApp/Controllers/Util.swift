//
//  Util.swift
//  BurgerApp
//
//  Created by Glussian on 1/2/19.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import UIKit
import Nuke

extension FileManager {
    class func clearCache() {
        let cacheURL =  FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first! as URL
        if let files = FileManager.default.enumerator(at: cacheURL, includingPropertiesForKeys: nil)  {
            for file in files {
                try? FileManager.default.removeItem(at: file as! URL)
            }
        }
        
    }
}

extension UIImageView {
    public func setUrlImage(url: URL?) {
        
        if let url = url {
            let myRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 5)
            var request: ImageRequest!
            request = ImageRequest(urlRequest: myRequest)
            Nuke.loadImage(with: request, into: self)
        }
        else {
            image = nil
        }
    }
}

extension UIViewController {
    func showError ( _ error : Error) {
        let alertController = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle : UIAlertControllerStyle.alert )
        
        let okButtonAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController.addAction(okButtonAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}


