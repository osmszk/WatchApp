//
//  InterfaceController.swift
//  WatchApp WatchKit Extension
//
//  Created by 鈴木治 on 2019/02/16.
//  Copyright © 2019年 Osamu Suzuki. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var categoryTable: WKInterfaceTable!
    
    var menus = Menu.allMenus()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        categoryTable.setNumberOfRows(menus.count, withRowType: "CategoryRow")
    
        for index in 0..<categoryTable.numberOfRows {
            guard let controller = categoryTable.rowController(at: index) as? CategoryRowController else { continue }
            
            controller.menu = menus[index]
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let menu = menus[rowIndex]
        presentController(withName: "Category", context: menu)
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
