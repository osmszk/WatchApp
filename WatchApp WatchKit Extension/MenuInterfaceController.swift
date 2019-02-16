//
//  MenuInterfaceController.swift
//  WatchApp WatchKit Extension
//
//  Created by 鈴木治 on 2019/02/16.
//  Copyright © 2019年 Osamu Suzuki. All rights reserved.
//

import WatchKit
import Foundation


class MenuInterfaceController: WKInterfaceController {

    var menu: Menu?
    
    @IBOutlet weak var menuTable: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let m = context as? Menu {
            self.menu = m
        }
        
        menuTable.setNumberOfRows(self.menu!.contents.count, withRowType: "MenuRow")
        
        for index in 0..<menuTable.numberOfRows {
            guard let controller = menuTable.rowController(at: index) as? DetailRowController else { continue }
            controller.content = self.menu!.contents[index]
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
