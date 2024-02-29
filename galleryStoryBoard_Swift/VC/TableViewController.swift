//
//  TableViewController.swift
//  galleryStoryBoard_Swift
//
//  Created by Ismael Reckziegel on 09/01/24.
//

import UIKit

class TableViewController: UIViewController {
    
    var alert: AlertController?
    
    var dataCell: [dataForCell] = []
    
    let imagePicker: UIImagePickerController = UIImagePickerController()
    
    @IBOutlet weak var addTextTextField: UITextField!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsUI()
        tableViewDelegate()
        imagePickerDelegate()
        textFieldDelegate()
        
        alert = AlertController(controller: self)
        
    }
    
    @IBAction func tappedAddImageButton(_ sender: UIButton) {
        
        if addTextTextField.text == "" {
            
            alert?.alertInformation(title: "Error", message: "Please enter a quote before!")
            
        } else {
            
            alert?.chooseImage(completion: { option in
                
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
            
        }, title: "Attention", message: "You really wanna logout")
        
    }
    
    func settingsUI() {
        
        addTextTextField.placeholder = "Your quote here!"
        addImageButton.setTitle("Add your favorites quotes & images!", for: .normal)
        addImageButton.backgroundColor = UIColor.systemGray5
        addImageButton.layer.cornerRadius = 5
        addImageButton.tintColor = UIColor.black
        
        exitButton.setTitle("", for: .normal)
        exitButton.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        exitButton.tintColor = UIColor.black
        
        addTextTextField.autocapitalizationType = .sentences
        
    }
    
    func tableViewDelegate() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        tableView.separatorStyle = .none
        
    }
    
    func imagePickerDelegate() {
        
        imagePicker.delegate = self
        
    }
    
    func textFieldDelegate() {
        
        addTextTextField.delegate = self
        
    }
    
}

extension TableViewController: UITableViewDelegate & UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataCell.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellTableView = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        cellTableView?.setupCell(image: dataCell[indexPath.row], text: dataCell[indexPath.row])
        
        cellTableView?.selectionStyle = .none
        
        return cellTableView ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
        
    }
    
    
}

extension TableViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            let newImage = dataForCell(imageModel: image, labelModel: addTextTextField.text!)
            
            dataCell.append(newImage)
            
            addTextTextField.text = ""
            
            tableView.reloadData()
            
        }
        
        picker.dismiss(animated: true)
        
    }
    
}

extension TableViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 4
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        textField.layer.borderWidth = 0
        
        textField.resignFirstResponder()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
    }
    
}
