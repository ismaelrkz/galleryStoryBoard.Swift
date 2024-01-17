//
//  AlertController.swift
//  galleryStoryBoard_Swift
//
//  Created by Ismael Reckziegel on 09/01/24.
//

import UIKit

class AlertController: NSObject {
    
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
     
        self.controller = controller
        
    }
    
    func alertInformation(title: String, message: String) {
        
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let buttonOK = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(buttonOK)
        
        controller.present(alertController, animated: true)
        
    }
    

}
