//
//  CustomCollectionViewCell.swift
//  galleryStoryBoard_Swift
//
//  Created by Ismael Reckziegel on 10/01/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    
    static let identifier: String = "CustomCollectionViewCell"
    
    static func nib() -> UINib {
        
        return UINib(nibName: self.identifier, bundle: nil)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        settingsUICell()
        
    }
    
    func settingsUICell() {
        
        imageCell.contentMode = .scaleAspectFill
        imageCell.layer.cornerRadius = 4
        
    }
    
    
    public func setupCell(image: imageForCell) {
        
        imageCell.image = image.imageModel
        
    }
    
}
