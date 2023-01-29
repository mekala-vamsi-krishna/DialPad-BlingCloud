//
//  ViewController.swift
//  BlingCloud-DialPadTask
//
//  Created by Mekala Vamsi Krishna on 28/01/23.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let model: [Model] = [
        Model(numbers: "1", letters: ""),
        Model(numbers: "2", letters: "A B C"),
        Model(numbers: "3", letters: "D E F"),
        Model(numbers: "4", letters: "G H I"),
        Model(numbers: "5", letters: "J K L"),
        Model(numbers: "6", letters: "M N O"),
        Model(numbers: "7", letters: "P Q R S"),
        Model(numbers: "8", letters: "T U V"),
        Model(numbers: "9", letters: "W X Y Z"),
        Model(numbers: "*", letters: ""),
        Model(numbers: "0", letters: "+"),
        Model(numbers: "#", letters: ""),
    ]
    
    lazy var leftRightSpacing = view.frame.width * 0.13
    lazy var interItemSpacing = view.frame.width * 0.1
    lazy var cellWidth = (view.frame.width - 2 * leftRightSpacing - 2 * interItemSpacing) / 3
    
    var dialedNumbersDisplayedString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(CollectionViewHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeaderView.identifier)
        collectionView.register(NumberCell.self, forCellWithReuseIdentifier: NumberCell.identifier)
        collectionView.register(CallButtonCell.self, forCellWithReuseIdentifier: CallButtonCell.identifier)
        collectionView.register(BackspaceCell.self, forCellWithReuseIdentifier: BackspaceCell.identifier)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewHeaderView.identifier, for: indexPath) as! CollectionViewHeaderView
        header.numbersLabel.text = dialedNumbersDisplayedString
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            if indexPath.item == 1{
                dialedNumbersDisplayedString = String(dialedNumbersDisplayedString.dropLast())
            }
        } else {
            let model = model[indexPath.row].numbers
            dialedNumbersDisplayedString += model
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        return .init(width: view.frame.width, height: view.frame.height * 0.2)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 1 {
            return 2
        }
        return model.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            if indexPath.item == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CallButtonCell.identifier, for: indexPath) as! CallButtonCell
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BackspaceCell.identifier, for: indexPath) as! BackspaceCell
                return cell
            }
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.identifier, for: indexPath) as! NumberCell
        cell.numbersLabel.text = model[indexPath.row].numbers
        cell.lettersLabel.text = model[indexPath.row].letters
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let leftRightSpaing = view.frame.width * 0.15
        
        if section == 1 {
            let leftPadding = (view.frame.width) / 2 - cellWidth / 2
            return .init(top: 0, left: leftPadding, bottom: 0, right: self.leftRightSpacing)
        }
        return .init(top: 16, left: leftRightSpaing, bottom: 16, right: leftRightSpaing)
    }

}
