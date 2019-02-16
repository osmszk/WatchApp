//
//  Menu.swift
//  WatchApp WatchKit Extension
//
//  Created by 鈴木治 on 2019/02/17.
//  Copyright © 2019年 Osamu Suzuki. All rights reserved.
//

import UIKit

class Menu {
    let category: String
    let contents: [String]
    
    init(category: String, contents: [String]) {
        self.category = category
        self.contents = contents
    }
    
    convenience init(dictionary: [String: Any]) {
        let category = dictionary["category"] as! String
        var contents: [String] = []
        if let menus = dictionary["menu"] as? [String] {
            contents = menus
        }
        
        self.init(category: category, contents: contents)
    }
    
    class func allMenus() -> [Menu] {
        var menus: [Menu] = []
        
        guard let path = Bundle.main.path(forResource: "hotcook_menu", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
                return menus
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String: Any]]
            json.forEach({ (dict: [String: Any]) in
                menus.append(Menu(dictionary: dict))
            })
        } catch let error as NSError {
            print(error)
        }    
        return menus
    }
    
}
