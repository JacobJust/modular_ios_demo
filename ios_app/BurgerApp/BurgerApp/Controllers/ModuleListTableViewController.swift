/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import Firebase
import Nuke
import PKHUD
import AVKit
import SDDownloadManager
import Darwin

class ModuleListTableViewController: UITableViewController {

  // MARK: Constants
  let listToUsers = "ListToUsers"
  
  // MARK: Properties
  var items: [Module] = []
  var user: User!
  let ref = Database.database().reference(withPath: "modules")
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  // MARK: UIViewController Lifecycle  
  override func viewDidLoad() {
    super.viewDidLoad()
    //clearCache()
    navigationController?.navigationBar.tintColor = Appearance.mainColor
    tableView.allowsMultipleSelectionDuringEditing = false
    tableView.tableFooterView = UIView()
    
    ref.queryOrdered(byChild: "name").observe(.value, with: { snapshot in
      var newItems: [Module] = []
      for child in snapshot.children {
        if let snapshot = child as? DataSnapshot,
          let module = Module(snapshot: snapshot) {
            
            if module.emails.contains(User.getCurrentUserEmail() ?? "") {
                newItems.append(module)
            }
          
        }
      }
      
      self.items = newItems
      self.tableView.reloadData()
    })
    
//    Auth.auth().addStateDidChangeListener { auth, user in
//      guard let user = user else { return }
//      self.user = User(authData: user)
//
//      let currentUserRef = self.usersRef.child(self.user.uid)
//      currentUserRef.setValue(self.user.email)
//      currentUserRef.onDisconnectRemoveValue()
//    }
    
  }
  
  // MARK: UITableView Delegate methods
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ModuleTableViewCell
    let module = items[indexPath.row]
    
    cell.moduleTitle?.text = module.name
    cell.moduleStatus?.text = module.isLibrairyDownloaded() ? "Module available" : "Module not download yet"

    cell.moduleIconImageView?.setUrlImage(url: URL(string: module.icon))
    cell.moduleProgressBar?.progress = 0
    cell.moduleProgressBar?.isHidden = true
    
   // cell.detailTextLabel?.text =
    
    return cell
  }
  
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      let module = items[indexPath.row]
        module.removeLibrairy()
        self.tableView.reloadData()
    }
  }
    
    
    func clearCache() {
        let cacheURL =  FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first! as URL
        if let files = FileManager.default.enumerator(at: cacheURL, includingPropertiesForKeys: nil)  {
            for file in files {
                try? FileManager.default.removeItem(at: file as! URL)
            }
        }

    }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath) as! ModuleTableViewCell
    let module = items[indexPath.row]
    
    tableView.deselectRow(at: indexPath, animated: true)
   
    if module.isLibrairyDownloaded(), let url = module.localLibrairy() {
        loadLibrairy(url: url)
    }
    else {
        downloadResource(module: module, cell: cell)
    }
    
    

  }
    
    func downloadResource(module : Module, cell: ModuleTableViewCell) {
        let urlRequest = URLRequest(url: URL(string: module.moduleResource!)!)
        
        let name = urlRequest.url?.lastPathComponent
        SDDownloadManager.shared.dowloadFile(withRequest: urlRequest, inDirectory: nil,withName:name,  onProgress: { (progress) in
            cell.moduleProgressBar?.progress = Float(progress)
            cell.moduleProgressBar?.isHidden = false
        }) { [weak self]  (error, url) in
            cell.moduleProgressBar?.isHidden = true
            if let error = error  {
                HUD.hide()
                self?.showError(error)
            }
            else {
                self?.tableView.reloadData()
                HUD.flash(.success)
            }
        }
    }
    

    func loadLibrairy(url: URL) {
        let path = url.path // "/usr/lib/libc.dylib"
        if let handle = dlopen(path, RTLD_LAZY) {
            
            if let aClass  = NSClassFromString("WelcomeViewController") as?  AnyClass {
                
                if let myClass = aClass as? NSObjectProtocol {
                    let selector = Selector("controller")
                    let controller = myClass.perform(selector).takeUnretainedValue()
                    self.navigationController?.pushViewController(controller as! UIViewController, animated: true)
                    print(controller)
                }
                
                
            }
            
            HUD.flash(.success)
        }
    }
  
//  func toggleCellCheckbox(_ cell: UITableViewCell, isCompleted: Bool) {
//    if !isCompleted {
//      cell.accessoryType = .none
//      cell.textLabel?.textColor = .black
//      cell.detailTextLabel?.textColor = .black
//    } else {
//      cell.accessoryType = .checkmark
//      cell.textLabel?.textColor = .gray
//      cell.detailTextLabel?.textColor = .gray
//    }
//  }
  
  // MARK: Add Item  
//  @IBAction func addButtonDidTouch(_ sender: AnyObject) {
//    let alert = UIAlertController(title: "Grocery Item",
//                                  message: "Add an Item",
//                                  preferredStyle: .alert)
//
//    let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
//      guard let textField = alert.textFields?.first,
//        let text = textField.text else { return }
//
//
//      let groceryItem = Module(name: text,
//                                    addedByUser: self.user.email,
//                                    completed: false)
//
//      let groceryItemRef = self.ref.child(text.lowercased())
//
//      groceryItemRef.setValue(groceryItem.toAnyObject())
//    }
    
//    let cancelAction = UIAlertAction(title: "Cancel",
//                                     style: .cancel)
//
//    alert.addTextField()
//
//    alert.addAction(saveAction)
//    alert.addAction(cancelAction)
//
//    present(alert, animated: true, completion: nil)
//  }
//
//  @objc func userCountButtonDidTouch() {
//    performSegue(withIdentifier: listToUsers, sender: nil)
//  }
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

