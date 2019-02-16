//
//  CategoryRowController.swift
//  WatchApp WatchKit Extension
//
//  Created by 鈴木治 on 2019/02/16.
//  Copyright © 2019年 Osamu Suzuki. All rights reserved.
//

import WatchKit
import UIKit

class CategoryRowController: NSObject {

    @IBOutlet var categoryLabel: WKInterfaceLabel!
    
    var menu: Menu? {
        didSet {
            guard let menu = menu else { return }
            categoryLabel.setText(menu.category)
        }
    }
}
