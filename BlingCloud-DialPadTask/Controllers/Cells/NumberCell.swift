//
//  NumberCell.swift
//  BlingCloud-DialPadTask
//
//  Created by Mekala Vamsi Krishna on 28/01/23.
//

import UIKit

class NumberCell: UICollectionViewCell {
    
    static let identifier = "numberCell"
    
    let numbersLabel = UILabel()
    let lettersLabel = UILabel()
    
    let defaultColor = UIColor(white: 0.9, alpha: 1)
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .darkGray : defaultColor
            numbersLabel.textColor = isHighlighted ? .white : .black
            lettersLabel.textColor = isHighlighted ? .white : .black
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = defaultColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
        
        numbersLabel.font = UIDevice.current.screenType == .iPhones_5_5s_5c_SE ? UIFont.systemFont(ofSize: 24) : .systemFont(ofSize: 32)
        numbersLabel.textAlignment = .center
        
        lettersLabel.font = UIDevice.current.screenType == .iPhones_5_5s_5c_SE ? UIFont.boldSystemFont(ofSize: 6) : .boldSystemFont(ofSize: 10)
        lettersLabel.textAlignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [numbersLabel, lettersLabel])
        stackView.axis = .vertical
        stackView.spacing = 0
        addSubview(stackView)
        stackView.centerInSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
