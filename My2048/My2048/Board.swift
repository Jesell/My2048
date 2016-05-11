//
//  Board.swift
//  My2048
//
//  Created by Jesell on 16/5/11.
//  Copyright © 2016年 Jesell. All rights reserved.
//

import UIKit
class Tile: UIView {
    var delegate: AppereanceProtocol
    var value : Int = 0 {
        //didset 在值变化后立刻调用
        //相对的 willset 在值变化前的调用
        didSet {
            //设置背景色
            backgroundColor = delegate.titleColor(value)
            numberLabel.textColor = delegate.numberColor(value)
            numberLabel.text = " \(value)"
        }
    }
    var numberLabel:UILabel
    //父类中必须要实现的初始化方法required
    required init(coder:NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    //初始化位置长宽等系数
    init(position:CGPoint,width:CGFloat,value:Int,radius:Cf=GL_FLOAT,delegate d:UIAppearanceProtocol){
        addSubview(numberLabel)
        layer.cornerRadius=radius
        
        self.value=value
        backgroundColor=delegate.tileColor(value)
        numberLabel.textColor=delegate.numberColor(value)
        numberLabel.text="\(value)"
    }
}
