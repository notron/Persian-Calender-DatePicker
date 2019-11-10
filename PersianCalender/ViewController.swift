//
//  ViewController.swift
//  PersianCalender
//
//  Created by Mahdi on 10/16/18.
//  Copyright © 2018 Mahdi Moayeri. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController, CalendarDelagete{
    
    
    
    @IBOutlet weak var fromDateButton : UIButton!
    @IBOutlet weak var toDateButton   : UIButton!
    
    private var fromDate = Date().yesterday
    private var toDate   = Date()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        update()
    }
    
    private func update() {
        
        fromDateButton.setTitle(fromDate.Jalali, for: .normal)
        toDateButton.setTitle(toDate.Jalali, for: .normal)
    }
    
    
    // MARK: - @IBAction
    
    @IBAction private func fromDateButton(_ sender: Any) {
        
        Utility.shared.openCalender(date: fromDate, secendDate: toDate, delagete: self, type: .start)
    }
    
    @IBAction private func toDateButton(_ sender: Any) {
        
        Utility.shared.openCalender(date: toDate, secendDate: fromDate, delagete: self, type: .end)
    }
    
    // MARK: - Protocol Delegate

    func chageDate(date: Date, type: CalendarType?) {
        
        if type == .start {
            fromDate = date
        } else if type == .end {
            toDate = date
        }
        update()
    }


}

