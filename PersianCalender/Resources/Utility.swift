//
//  Utility.swift
//  SnappFood
//
//  Created by Mahdi on 7/22/18.
//  Copyright © 2018 ZoodFood Mac. All rights reserved.
//

import Foundation
import UIKit

public class Utility {
    
    private init() {}
    public static let shared = Utility()
    
    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
//        if let tabController = controller as? UITabBarController {
//            if let selected = tabController.selectedViewController {
//                return topViewController(controller: selected)
//            }
//        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    func openCalender(date : Date, secendDate : Date, delagete: CalendarDelagete, type : CalendarType?) {
        
        let calender = CalendarViewController(nibName: "CalendarViewController", bundle: nil,date : date, delagete: delagete, type: type, secendDate: secendDate)
        calender.modalPresentationStyle = .overCurrentContext
        
        Utility.shared.topViewController()?.present(calender, animated: false, completion: nil)
        
    }
    
}

