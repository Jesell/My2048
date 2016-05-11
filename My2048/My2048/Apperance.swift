//
//  Apperance.swift
//  My2048
//
//  Created by Jesell on 16/5/11.
//  Copyright © 2016年 Jesell. All rights reserved.
//

import UIKit

protocol ApperanceProtocol: class {
    func titleColor(Value: Int) -> UIColor
    func numberColor(value: Int)-> UIColor
    func fontForNumbers() -> UIFont
}

class Apperance: ApperanceProtocol{
    func func titleColor(Value: Int) -> UIColor {
        switch Value{
        case 2:
            return UIColor(red: 238.0/255.0, green: 228.0/255.0,
                       blue: 218.0/255/0, alpha:1.0)
        case 4:
            return UIColor(red: 237.0/255.0, green: 224.0/255.0,
                       blue: 200.0/255/0, alpha:1.0)
        case 8:
            return UIColor(red: 242.0/255.0, green: 177.0/255.0,
                       blue: 121.0/255/0, alpha:1.0)
        
        case 16:
            return UIColor(red: 245.0/255.0, green: 149.0/255.0,
                       blue: 99.0/255/0, alpha:1.0)
        case 32:
            return UIColor(red: 246.0/255.0, green: 124.0/255.0,
                       blue: 95.0/255/0, alpha:1.0)
        case 64:
            return UIColor(red: 246.0/255.0, green: 94.0/255.0,
                       blue: 59.0/255/0, alpha:1.0)
        case 128, 256, 512, 1024, 2048:
            return UIColor(red: 237.0/255.0, green: 207.0/255.0,
                       blue: 114.0/255/0, alpha:1.0)
        default:
            return UIColor.whiteColor()
        }
    }
    func  numberColor(value :Int) -> UIColor {
        switch  value {
        case 2, 4:
            return UIColor(red: 119.0/255.0, green: 110.0/255.0,
                           blue: 101.0/255/0, alpha:1.0)
        default:
            return UIColor.whiteColor()
        }
    }
    func fontFornumbers(value: Int) -> UIFont {
        if let font = UIFont(name: "HelveticaNeue-Bold", size: 20)
            {
                return font
            }
            return UIFont.systemFontOfSize(20)
    }
}

