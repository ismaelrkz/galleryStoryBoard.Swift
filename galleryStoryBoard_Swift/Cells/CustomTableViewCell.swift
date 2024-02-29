//
//  CustomTableViewCell.swift
//  galleryStoryBoard_Swift
//
//  Created by Ismael Reckziegel on 09/01/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelCell: UILabel!
    
    static let identifier: String = "CustomTableViewCell"
    
    static func nib() -> UINib {
        
        return UINib(nibName: self.identifier, bundle: nil)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        settingsUICell()
        
    }

    func setupCell(image: dataForCell, text: dataForCell) {
        
        imageCell.image = image.imageModel
        labelCell.text = text.labelModel
        
    }
    
    func settingsUICell() {
        
        imageCell.contentMode = .scaleAspectFill
        imageCell.layer.cornerRadius = 4
        
        labelCell.numberOfLines = 0
        labelCell.lineBreakMode = .byWordWrapping
        
    }
    
}
