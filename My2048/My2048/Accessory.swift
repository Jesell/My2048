//
//  Accessory.swift
//  My2048
//
//  Created by Jesell on 16/5/11.
//  Copyright © 2016年 Jesell. All rights reserved.
//

import UIKit
protocol ScoreViewProtocol {
    func scoreChanged(newScore s: Int)
}
//score属性为当前游戏得分
class ScoreView: UIView, ScoreViewProtocol {
    var score:Int = 0{
        didSet{
            //用didset监视变化，用label显示得分
            label.text = "SCORE: \(score)"
        }
    }
    let defaultFrame = CGRectMake(0, 0, 140, 140)
    var label: UILabel
    
    //初始化得分栏的背景色
    init(backgroundColor bgcolor: UIColor, textColor tcolor:UIColor,
                         font: UIFont, radius r: CGFloat){
        label = UILabel(frame: defaultFrame)
        label.textAlignment = NSTextAlignment.Center
        super.init(frame: defaultFrame)
        
        backgroundColor = bgcolor
        label.textColor = tcolor
        label.font = font
        
        layer.cornerRadius = r
        self.addSubview(label)
    }
    
    required init(coder aDecoder: NSCoder){
        fatalError("NSCoding not supported")
    }
    //函数用于改变显示的分数
    func scoreChanged(newScore s: Int) {
        let defaultFrame = CGRectMake(0 , 0 , 140, 140)
    }
}