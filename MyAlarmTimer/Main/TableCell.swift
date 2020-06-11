import UIKit

class TableCell: UICollectionViewCell {
    
    func setupCell() {
        layer.backgroundColor = UIColor(red: 0.54, green: 0.714, blue: 0.975, alpha: 0.2).cgColor
        layer.cornerRadius = 14
    }
}
