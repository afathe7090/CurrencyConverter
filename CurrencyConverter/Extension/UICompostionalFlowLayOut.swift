//
//  UICompostionalFlowLayOut.swift
//  CurrencyConverter
//
//  Created by Abdelaziz Reda on 29/10/2022.
//

import UIKit

func layOut()-> UICollectionViewCompositionalLayout{
    
    let itemSize =  NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(125))
    let items = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(130))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [items])
    
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    
    return UICollectionViewCompositionalLayout(section: section)
    
}



