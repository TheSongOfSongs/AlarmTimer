//
//  NewAlarmViewController.swift
//  MyAlarmTimer
//
//  Created by Jinhyang on 2020/05/29.
//  Copyright © 2020 Jinhyang. All rights reserved.
//

import UIKit

class NewAlarmViewController: UIViewController {
    
    @IBOutlet weak var squareLabel: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setSquareBorder()
    }
    
    func setSquareBorder() {
        let borderColor = UIColor(red: 0.54, green: 0.714, blue: 0.975, alpha: 1).cgColor
        let squareFrame = self.squareLabel.frame
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0.0, y: 0.0, width: squareFrame.width, height: 2)
        topBorder.backgroundColor = borderColor
        
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0, y: squareFrame.height, width: squareFrame.width, height: 2)
        bottomBorder.backgroundColor = borderColor
        
        squareLabel.layer.addSublayer(topBorder)
        squareLabel.layer.addSublayer(bottomBorder)
    }

}
