//
//  CalendarViewController.swift
//  PersianCalender
//
//  Created by Mahdi on 10/16/18.
//  Copyright © 2018 Mahdi Moayeri. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var datePicker   : UIDatePicker!
    @IBOutlet weak var errorLabel   : UILabel!
    @IBOutlet weak var submitButton : UIButton!
    
    private var delagete    : CalendarDelagete!
    private var currentDate : Date!
    private var secendDate  : Date!
    private var type : CalendarType?

// MARK: - Initial Methode
    
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, date : Date, delagete: CalendarDelagete, type : CalendarType?, secendDate : Date) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.delagete    = delagete
        self.currentDate = date
        self.type        = type
        self.secendDate  = secendDate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDatePicker()
    }
    
    
// MARK: - UIDatePicker Methode
    
    func setupDatePicker() {
        
        datePicker.date = currentDate
        datePicker.datePickerMode = .date
        datePicker.calendar = NSCalendar(identifier: NSCalendar.Identifier.persian) as Calendar?
        datePicker.locale = NSLocale(localeIdentifier: "fa_IR") as Locale
        datePicker.addTarget(self, action: #selector(self.dateChanged(_:)), for: .valueChanged)
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        
        currentDate = sender.date.noon
        secendDate = secendDate.noon
        
        
        if type == CalendarType.start {
            if currentDate > secendDate {
                errorLabel.text = Constants.Strings.startDateErlyfromStopDate
                submitButton.isEnabled = false
                submitButton.backgroundColor = .gray
            } else {
                errorLabel.text = ""
                submitButton.isEnabled = true
                submitButton.backgroundColor = .PRIMARY_COLOR
            }
        } else {
            if secendDate > currentDate {
                errorLabel.text = Constants.Strings.stopDateErlyfromStartDate
                submitButton.isEnabled = false
                submitButton.backgroundColor = .gray
            } else {
                errorLabel.text = ""
                submitButton.isEnabled = true
                submitButton.backgroundColor = .PRIMARY_COLOR
            }
        }
    }

    
    
// MARK: - @IBAction
    
    @IBAction private func close(_ sender: Any) {
        
        dismiss(animated: false)
        
    }
    
    @IBAction private func done(_ sender: Any) {
        
        delagete.chageDate(date: currentDate, type: type)
        
        dismiss(animated: false)
    }
    
}

// MARK: - Dependent Class

protocol CalendarDelagete {
    
    func chageDate(date: Date, type: CalendarType?)
}

enum CalendarType {
    
    case start
    case end
}
