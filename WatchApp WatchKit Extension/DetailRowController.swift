//
//  DetailRowController.swift
//  WatchApp WatchKit Extension
//
//  Created by 鈴木治 on 2019/02/16.
//  Copyright © 2019年 Osamu Suzuki. All rights reserved.
//

import WatchKit

class DetailRowController: NSObject {

    @IBOutlet var detailLabel: WKInterfaceLabel!
    
    var content: String? {
        didSet {
            guard let content = content else { return }
            detailLabel.setText(content)  
        }
    }
}
