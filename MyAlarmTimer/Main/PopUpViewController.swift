//
//  PopUpViewController.swift
//  MyAlarmTimer
//
//  Created by Jinhyang on 2020/06/26.
//  Copyright © 2020 Jinhyang. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var dayView: UIView!
    
    @IBOutlet weak var alarmTitle: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
    }
    
    
    // MARK: - View settings
    func setView() {
        setPopUpViewShadow()
        setSquareBorder()
        setDayView()
    }
    
    func setPopUpViewShadow() {
        self.view.layer.cornerRadius = 14
        self.view.layer.shadowRadius = 14
        self.view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.view.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.view.layer.shadowRadius = 4
        self.view.layer.shadowOpacity = 1
    }
    
    func setSquareBorder() {
        let borderColor = UIColor(red: 0.54, green: 0.714, blue: 0.975, alpha: 1).cgColor
        let squareFrame = timeView.frame
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0.0, y: 0.0, width: squareFrame.width, height: 2)
        topBorder.backgroundColor = borderColor
        
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0, y: squareFrame.height, width: squareFrame.width, height: 2)
        bottomBorder.backgroundColor = borderColor
        
        timeView.layer.addSublayer(topBorder)
        timeView.layer.addSublayer(bottomBorder)
    }
    
    func setDayView() {
        dayView.layer.cornerRadius = 14
    }
}
