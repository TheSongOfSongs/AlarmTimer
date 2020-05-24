//
//  ListViewController.swift
//  MyAlarmTimer
//
//  Created by Jinhyang on 2020/05/21.
//  Copyright © 2020 Jinhyang. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var currentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        setupSegmentedControl()
    }
    
    @IBAction func calendar(_ sender: UIButton) {
        print(">>")
        add(asChildViewController: calendarViewController)
    }
    
    
    
    
    
    private func setupSegmentedControl() {
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "summary", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "sessions", at: 1, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        
        segmentedControl.selectedSegmentIndex = 0
    }
    
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    
    private lazy var calendarViewController: CalendarViewController = {
        print("loaded")
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "Calendar") as! CalendarViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
     func updateView() {
        print("!!!")
//        if segmentedControl.selectedSegmentIndex == 0 {
//            remove(asChildViewController: calendarViewController)
//        } else {
//            add(asChildViewController: calendarViewController)
//        }
        
        add(asChildViewController: calendarViewController)
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    private func add2(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        
        
        
        addChild(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    
    
    
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
}

