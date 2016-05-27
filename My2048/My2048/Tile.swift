//
//  Tile.swift
//  My2048
//
//  Created by Jesell on 16/5/11.
//  Copyright © 2016年 Jesell. All rights reserved.
//

import UIKit
//tile就是方块
class Tile: UIView {
    //用于控制颜色，
    var delegate: AppereanceProtocol
    //表示当前tile中的数值
    var value : Int = 0 {
        //didset 在值变化后立刻调用，用于监视
        //相对的 willset 在值变化前的调用
        didSet {
            //设置背景色
            backgroundColor = delegate.titleColor(value)
            numberLabel.textColor = delegate.numberColor(value)
            numberLabel.text = " \(value)"
        }
    }
    //每一个numberlabel用于显示对应value的值
    var numberLabel:UILabel
    //父类中必须要实现的初始化方法required
    required init(coder:NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    //初始化位置长宽等系数
    init(position: CGPoint,width: CGFloat,value: Int,radius: CGFloat, delegate:AppearanceProtocol){
        addSubview(numberLabel)
        layer.cornerRadius=radius
        //获取当前值value
        self.value=value
        backgroundColor=delegate.tileColor(value)
        numberLabel.textColor=delegate.numberColor(value)
        numberLabel.text="\(value)"
    }
}
