//
//  CollectionViewController.swift
//  galleryStoryBoard_Swift
//
//  Created by Ismael Reckziegel on 09/01/24.
//
#warning("Salvar os Snippets necessários")
import UIKit

class CollectionViewController: UIViewController {
    
    var alert: AlertController?
    
    let imagePicker: UIImagePickerController = UIImagePickerController()
    
    var dataCell: [imageForCell] = []
    
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsUI()
        settingsDelegateCollectionView()
        settingsDelegateImagePicker()
        
        alert = AlertController(controller: self)
        
    }
    
    @IBAction func tappedAddImageButton(_ sender: UIButton) {
        
        self.alert?.chooseImage(completion: { option in
            
            switch option {
                
            case .camera:
                
                self.imagePicker.sourceType = .camera
                
                self.present(self.imagePicker, animated: true)
                
            case .library:
                
                self.imagePicker.sourceType = .photoLibrary
                
                self.present(self.imagePicker, animated: true)
                
            case .cancel:
                
                break
                
            }
            
        })
        
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
    
    func settingsDelegateCollectionView() {
        
        collectionView.delegate = self
        
        collectionView.dataSource = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            layout.scrollDirection = .vertical
            layout.estimatedItemSize = .zero
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 5
            
            let cellSize = (collectionView.bounds.width - (2 * layout.minimumInteritemSpacing)) / 2
            layout.itemSize = CGSize(width: cellSize, height: cellSize)
            
        }
        
        collectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
    }
    
    func settingsDelegateImagePicker() {
        
        imagePicker.delegate = self
        
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegate & UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataCell.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        
        cellCollection?.setupCell(image: dataCell[indexPath.row])
        
        return cellCollection ?? UICollectionViewCell()
        
    }
    
}

extension CollectionViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            let newImage = imageForCell(imageModel: image)
            
            dataCell.append(newImage)
            
            collectionView.reloadData()
            
        }
        
        picker.dismiss(animated: true)
        
    }
    
}




