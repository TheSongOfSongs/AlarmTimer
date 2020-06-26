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
    var viewSize: CGSize?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let viewSize = self.viewSize {
            self.view.frame = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)
        }
    }
    
    
    @IBAction func createAlarm(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let newAlarmViewController = storyboard.instantiateViewController(identifier: "newAlarm") as? NewAlarmViewController else { return }
        
        newAlarmViewController.modalPresentationStyle = .overCurrentContext
        
        self.present(newAlarmViewController, animated: true, completion: nil)
    }
}


