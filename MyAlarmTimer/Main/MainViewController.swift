//
//  ViewController.swift
//  MyAlarmTimer
//
//  Created by Jinhyang on 2020/05/20.
//  Copyright © 2020 Jinhyang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var listTable: UIButton!
    @IBOutlet weak var listCalendar: UIButton!
    @IBOutlet var listView: UIView!
    
    let dateFormmater: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M월 d일 EEEE"
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.locale = Locale(identifier: "ko-KR")
        
        return dateFormatter
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTime()
        add(tableViewController, listView)
    }
    
    
    @IBAction func listTable(_ sender: UIButton) {
        remove(calendarViewController, listView)
        add(tableViewController, listView)
    }
    
    
    @IBAction func listCalendar(_ sender: UIButton) {
        remove(tableViewController, listView)
        add(calendarViewController, listView)
    }
    
    private lazy var tableViewController: TableViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let tableViewController = storyboard.instantiateViewController(identifier: "Table")
            as? TableViewController else { return TableViewController() }
        tableViewController.viewSize = self.listView.frame.size
        
        self.add(tableViewController, listView)
        
        return tableViewController
    }()
    
    private lazy var calendarViewController: CalendarViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let calendarViewController = storyboard.instantiateViewController(identifier: "Calendar")
            as? CalendarViewController else { return CalendarViewController() }
        self.add(calendarViewController, listView)
        
        return calendarViewController
    }()
    
    func setupTime() {
        let today = Date()
        dateTitle.text = dateFormmater.string(from: today)
    }
}

extension UIViewController {
    func add(_ child: UIViewController, _ view: UIView) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove(_ child: UIViewController, _ view: UIView) {
        guard parent != nil else { return }
        
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}
