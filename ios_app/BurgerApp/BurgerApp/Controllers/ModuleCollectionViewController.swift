//
//  ModuleCollectionViewController.swift
//  BurgerApp
//
//  Created by Glussian on 1/2/19.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import UIKit
import Firebase
import Nuke
import PKHUD

private let reuseIdentifier = "Cell"

class ModuleCollectionViewController: UICollectionViewController {

    // MARK: Properties
    var items: [Module] = []
    let ref = Database.database().reference(withPath: "modules")
    
    func setupDataSource() {
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
            self.reloadData()
        })
    }
    
    func reloadData() {
        self.collectionView?.reloadData()
    }
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Module List"
        setupDataSource()
        let imageView = UIImageView(image: UIImage(named: "mainbackground"))
        imageView.contentMode = .scaleAspectFill
        self.collectionView?.backgroundView = imageView
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .done, target: self, action: #selector(clearCache))
        
    }
    
    @objc func clearCache() {
        FileManager.clearCache()
        reloadData()
    }
    
   
    

    
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            let module = items[indexPath.row]
//            module.removeLibrairy()
//            self.tableView.reloadData()
//        }
//    }
    
    

    
    func downloadResource(module : Module, cell: ModuleCollectionViewCell) {
        
        module.downloadLibrairyResource(progressBlock: { (progress) in
            cell.moduleProgressBar?.progress = Float(progress)
            cell.moduleProgressBar?.isHidden = false
        }) { [weak self]  (error, url) in
            cell.moduleProgressBar?.isHidden = true
            if let error = error  {
               
                self?.showError(error)
            }
            else {
                self?.reloadData()
            }
        }
        
    }
    

   


    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ModuleCollectionViewCell
        let module = items[indexPath.row]
        
        cell.moduleTitle?.text = module.name
        cell.moduleImageView?.alpha = module.isLibrairyDownloaded() ? 1:0.1
        
        cell.moduleDownloadButton?.isHidden = module.isLibrairyDownloaded()
        
        cell.moduleImageView?.setUrlImage(url: URL(string: module.icon))
        cell.moduleProgressBar?.progress = 0
        cell.moduleProgressBar?.isHidden = true
    
        return cell
    }


    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ModuleCollectionViewCell
        let module = items[indexPath.row]
        
        
        if module.isLibrairyDownloaded(), let url = module.localLibrairy() {
            if let controller = module.getController() {
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
        else {
            downloadResource(module: module, cell: cell)
        }
    }
  

    

}
