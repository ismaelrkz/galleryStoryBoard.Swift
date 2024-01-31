//
//  CollectionViewController.swift
//  galleryStoryBoard_Swift
//
//  Created by Ismael Reckziegel on 09/01/24.
//

import UIKit

class CollectionViewController: UIViewController {

    var alert: AlertController?
    
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsUI()
        
        alert = AlertController(controller: self)
        
    }
    
    @IBAction func tappedAddImageButton(_ sender: UIButton) {
        
        // implementação do conteúdo das células
        
    }
    
    @IBAction func tappedExitButton(_ sender: UIButton) {
        
        alert?.alertConfirmation(completion: { option in
            
            switch option {
            case .yes:
                
                let view: UIViewController? = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as? ViewController
                
                self.navigationController?.setViewControllers([view ?? UIViewController()], animated: true)
                
            case .no:
                
                break
                
            }
            
        }, title: "Attention", message: "You really wanna log out?")
        
    }
    
    func settingsUI() {
        
        addImageButton.backgroundColor = UIColor.systemGray5
        addImageButton.layer.cornerRadius = 5
        addImageButton.setTitle("Add your favorite images!", for: .normal)
        addImageButton.tintColor = UIColor.black
        
        exitButton.layer.cornerRadius = 5
        exitButton.setTitle("", for: .normal)
        exitButton.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        exitButton.tintColor = UIColor.black
        
    }
    
}


