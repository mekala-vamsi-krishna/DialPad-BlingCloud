//
//  CollectionViewHeaderView.swift
//  BlingCloud-DialPadTask
//
//  Created by Mekala Vamsi Krishna on 28/01/23.
//

import UIKit

class CollectionViewHeaderView: UICollectionReusableView {
    
    static let identifier = "CollectionViewHeaderView"
    
    let numbersLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        numbersLabel.text = "123"
        numbersLabel.font = UIFont.systemFont(ofSize: 32)
        numbersLabel.adjustsFontSizeToFitWidth = true
        numbersLabel.textAlignment = .center
        addSubview(numbersLabel)
        numbersLabel.fillSuperview(padding: .init(top: 0, left: 32, bottom: 0, right: 32))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
