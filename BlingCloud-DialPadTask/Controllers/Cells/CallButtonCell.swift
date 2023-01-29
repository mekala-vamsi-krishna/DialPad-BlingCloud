//
//  CallButtonCell.swift
//  BlingCloud-DialPadTask
//
//  Created by Mekala Vamsi Krishna on 28/01/23.
//

import UIKit

class CallButtonCell: UICollectionViewCell {
    
    static let identifier = "CallButtonCell"
    
    let imageView = UIImageView(image: UIImage(named: "phone"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGreen
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
