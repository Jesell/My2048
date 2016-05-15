//
//  Appearance.swift
//  My2048
//
//  Created by Jesell on 16/5/11.
//  Copyright © 2016年 Jesell. All rights reserved.
//

import UIKit
//protocol? :class? 两个疑问

//辅助用，游戏颜色的变化
protocol AppearanceProtocol: class {
    //三个函数，分别对应title的颜色，number的颜色和font的颜色
    func tileColor(value: Int) -> UIColor
    func numberColor(value: Int)-> UIColor
    func fontForNumbers() -> UIFont
}

//若出现没有正确继承，可能是某个函数与夫类中的声明不一致
class Appearance: AppearanceProtocol {
    //扩展UIcolor，每个值对应正方形不同的颜色。
     func tileColor(value: Int) -> UIColor {
        //value表示当前显示的值
        switch value{
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
    //设置了数字本身对应的不同颜色
    func  numberColor(value :Int) -> UIColor {
        switch  value {
        case 2, 4:
            return UIColor(red: 119.0/255.0, green: 110.0/255.0,
                           blue: 101.0/255/0, alpha:1.0)
        default:
            return UIColor.whiteColor()
        }
    }
    //设置了当前的字体
    func fontForNumbers() -> UIFont {
        if let font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        {
            return font
        }
        return UIFont.systemFontOfSize(20)
    }
}
