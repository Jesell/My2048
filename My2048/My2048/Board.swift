//
//  Board.swift
//  My2048
//
//  Created by Jesell on 16/5/11.
//  Copyright © 2016年 Jesell. All rights reserved.
//
 import UIKit

class Board : UIView {
    var dimension: Int
    var tileWidth: CGFloat
    var tilePadding: CGFloat
    var cornerRadius: CGFloat
    //将所有的tile存在一个dictionary中
    var tiles: Dictionary<NSIndexPath, Tile>
    
    //控制颜色用
    let provider = Appearance()
    
    //控制动画用
    let tilePoStartScale: CGFloat = 1.0
    let tileMergeExpandTime: NSTimeInterval= 0.08
    let tileMergeContractTime: NSTimeInterval = 0.08
    
    let perSquareSlideDuration: NSTimeInterval = 0.08
    
    //初始化
    init(dimension d: Int, tilewidth width: CGFloat, tilePadding padding: CGFloat, cornRadius radius: CGFloat, backgroundColor: UIColor, foregroundColor: UIColor){
        assert(d>0)
        dimension=d
        tileWidth=width
        tilePadding=padding
        cornerRadius=radius
        tiles=Dictionary()
        let sideLength = padding + CGFloat(dimension)*(width + padding)
        super.init(frame: CGRectMake(0, 0, sideLength, sideLength))
        layer.cornerRadius = radius
        //九宫格布局创建方法
        setupBackground(backgroundColor: backgroundColor, tileColor: foregroundColor)
        
    }
    
    required init(coder: NSCoder){
        fatalError("NSCoding not supported")
    }
    
    //重新设置游戏面板
    func reset(){
        for (key, tile) in tiles {
            tile.removeFromSuperview()
        }
        tiles.removeAll(keepCapacity: true)
    }
    
    //
    func positionIsVaild(pos: (Int,Int))-> Bool {
        let (x,y) = pos
        return(x >= 0 && x < dimension && y>= 0 && y < dimension)
    }
    
    func setBackground(backgroundColor bgColor: UIColor, tileColor: UIColor) {
        backgroundColor = bgColor
    }
}



