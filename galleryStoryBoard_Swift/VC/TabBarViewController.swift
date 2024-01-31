//
//  TabBarViewController.swift
//  galleryStoryBoard_Swift
//
//  Created by Ismael Reckziegel on 08/01/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        settingsUITabBar()
        
    }
    
    
    func settingsUITabBar() {
        
        if let itens = self.tabBar.items {
            
            itens[0].image = UIImage(systemName: "photo.on.rectangle.angled")
            itens[1].image = UIImage(systemName: "photo.stack")
            
            itens[0].title = "CollectionView"
            itens[1].title = "TableView"
        
            UITabBar.appearance().tintColor = UIColor.black
            
        }
        
    }

}
