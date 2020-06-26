//
//  NewAlarmViewController.swift
//  MyAlarmTimer
//
//  Created by Jinhyang on 2020/05/29.
//  Copyright © 2020 Jinhyang. All rights reserved.
//

import UIKit

class NewAlarmViewController: UIViewController {
    
    @IBOutlet weak var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPopUpView()
    }
    
    func setPopUpView() {
        let width = self.view.frame.width - 20 * 2
        let height = CGFloat(280)
        
        popUpView.frame = CGRect(x: 20, y: 191, width: width, height: height)
    }
}

