//
//  Date.swift
//  vendor
//
//  Created by Mahdi on 10/6/18.
//  Copyright © 2018 Mahdi Moayeri. All rights reserved.
//

import Foundation

extension Date {
    
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    
    var tenDayPast : Date {
        return Calendar.current.date(byAdding: .day, value: -10, to: noon)!
    }
    
    var sixMonthPast : Date {
        return Calendar.current.date(byAdding: .month, value: -6, to: noon)!
    }
    
    var twoYearPast : Date {
        return Calendar.current.date(byAdding: .month, value: -24, to: noon)!
    }
    
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    
    var Jalali: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.locale = Locale(identifier: "fa_IR")
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let dateString = dateFormatter.string(from: self)
        
        return dateString
    }
    
    var apiType: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: self)
        
        return dateString
    }
    
}
