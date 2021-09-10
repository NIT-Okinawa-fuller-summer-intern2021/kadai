//
//  CustomOkashiTableViewCell.swift
//  Okashi
//
//  Created by fuller on 2021/09/10.
//

import UIKit

class CustomOkashiTableViewCell: UITableViewCell {

    @IBOutlet weak var okashiImageView: UIImageView!
    @IBOutlet weak var okashiNameLabel: UILabel!
    
    func configure(image: UIImage, name: String){
        okashiImageView.image = image
        okashiNameLabel.text = name
    }
}
