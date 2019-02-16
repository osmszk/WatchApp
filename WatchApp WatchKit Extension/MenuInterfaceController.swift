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

    var menus = [["1-1 チキンと野菜のカレー", "1-2 ビーフカレー", "1-3 キーマカレー","1-4 ビーフシチュー"],
                   ["2-1 肉じゃが", "2-2 筑前煮", "2-3 かぼちゃの煮物", "2-4 白菜と豚バラの重ね煮"],
                   ["3-1 小松菜", "3-2 ブロッコリー", "3-3 アスパラガス", "3-4 いも／かぼちゃ"]]
    
    var category: String?
    
    @IBOutlet weak var menuTable: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let cat = context as? String {
            self.category = cat
        }
        
        var contents: [String] = []
        //["カレー・スープ", "煮物", "ゆでモノ"]
        switch self.category {
        case "カレー・スープ":
            contents = menus[0]
        case "煮物":
            contents = menus[1]
        case "ゆでモノ":
            contents = menus[2]
        default:
            contents = []
        }
        
        menuTable.setNumberOfRows(contents.count, withRowType: "MenuRow")
        
        for index in 0..<menuTable.numberOfRows {
            guard let controller = menuTable.rowController(at: index) as? DetailRowController else { continue }
            controller.menu = contents[index]
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
