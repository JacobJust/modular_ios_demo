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

import Foundation
import Firebase

struct Module {
  
  let ref: DatabaseReference?
  let key: String
  let name: String

  let icon: String
  let controllerName: String
    let emails : [String]
    let moduleResource: String?
  
    func isLibrairyDownloaded() -> Bool {
        if let url = localLibrairy() {
            return FileManager.default.fileExists(atPath: url.path )
        }
        return false
        
    }
    
    func removeLibrairy() {
        if let url = localLibrairy() {
            try? FileManager.default.removeItem(at: url)
        }
    }
    
    func localLibrairy() -> URL? {
        guard let moduleResource = moduleResource else { return nil }
        let cacheURL =  FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first! as URL
        let url = URL(string: moduleResource)!
        let result = cacheURL.appendingPathComponent(url.lastPathComponent)
        return result
        
    }
    
   
  init?(snapshot: DataSnapshot) {
    guard
      let value = snapshot.value as? [String: AnyObject],
      let name = value["name"] as? String,
      let icon = value["icon"] as? String,
        let emails = value["emails"] as? [String],
      let controllerName = value["controlerName"] as? String else {
      return nil
    }
    
    self.ref = snapshot.ref
    self.key = snapshot.key
    self.name = name
    self.icon = icon
    self.emails = emails
    self.controllerName = controllerName
    self.moduleResource = value["moduleResource"] as? String
  }
  
 
}
