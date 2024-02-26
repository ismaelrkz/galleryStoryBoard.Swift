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
    
    enum Action {
        
        case yes
        case no
        
    }

    func alertConfirmation(completion: @escaping (_ option: Action) -> Void, title: String, message: String) {
        
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes", style: .default) { action in
            
            completion(.yes)
            
        }
        
        let no = UIAlertAction(title: "No", style: .cancel) { action in
            
            completion(.no)
            
        }
        
        alertController.addAction(yes)
        alertController.addAction(no)
        
        controller.present(alertController, animated: true)
        
    }
    
    enum typeImageSelect {
        
        case camera
        case library
        case cancel
        
    }
    
    func chooseImage (completion: @escaping (_ option: typeImageSelect) -> Void) {
        
        let alertController: UIAlertController = UIAlertController(title: "Select one of the options below", message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { action in
            
            completion(.camera)
            
        }
        
        let library = UIAlertAction(title: "Library", style: .default) { action in
        
            completion(.library)
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
            
            completion(.cancel)
            
        }
        
        alertController.addAction(camera)
        alertController.addAction(library)
        alertController.addAction(cancel)
        
        controller.present(alertController, animated: true)

        
    }
    
    
}
