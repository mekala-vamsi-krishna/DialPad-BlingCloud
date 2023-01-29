//
//  BackspaceCell.swift
//  BlingCloud-DialPadTask
//
//  Created by Mekala Vamsi Krishna on 28/01/23.
//

import UIKit

class BackspaceCell: UICollectionViewCell {
    
    static let identifier = "BackspaceCell"
    
    let imageView = UIImageView(image: UIImage(named: "backspace"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .init(white: 0.9, alpha: 1)
        
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.centerInSuperview(size: .init(width: 40, height: 40))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
