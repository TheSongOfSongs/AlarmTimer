//
//  ListViewController.swift
//  MyAlarmTimer
//
//  Created by Jinhyang on 2020/05/21.
//  Copyright © 2020 Jinhyang. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    let customAlarmViewModel = CustomAlarmViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

class TableCell: UICollectionViewCell {
    
    func setupCell() {
        layer.backgroundColor = UIColor(red: 0.54, green: 0.714, blue: 0.975, alpha: 0.2).cgColor
        layer.cornerRadius = 14
    }
    
}


extension TableViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return customAlarmViewModel.numOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TableCell", for: indexPath)
            as? TableCell else { return UICollectionViewCell() }
        cell.setupCell()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TableHeader", for: indexPath) as? TableHeaderView else {
                return UICollectionReusableView()
            }
            
            guard let section = CustomAlarmViewModel.Section(rawValue: indexPath.section) else {
                return UICollectionReusableView()
            }
            
            header.sectionTitle.text = section.title
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

//extension TableViewController: UICollectionViewDelegate {
//
//}

extension TableViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin:CGFloat = 20
        let width: CGFloat = collectionView.frame.width - margin * 2
        let height: CGFloat = 53
        return CGSize(width: width, height: height)
    }
}

