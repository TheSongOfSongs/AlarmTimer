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

    @IBAction func createAlarm(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let newAlarmViewController = storyboard.instantiateViewController(identifier: "newAlarm") as? NewAlarmViewController else { return }
        
        newAlarmViewController.modalPresentationStyle = .overCurrentContext
        
        self.present(newAlarmViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


