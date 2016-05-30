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
    
    //padding 元素边框与元素内容之间的空间
    var tilePadding: CGFloat

    //圆角属性
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
    init(padding d: Int, tilewidth width: CGFloat, tilePadding padding: CGFloat, cornRadius radius: CGFloat, backgroundColor: UIColor, foregroundColor: UIColor){
        assert(d>0)
        dimension=d
        tileWidth=width
        tilePadding=padding
        cornerRadius=radius
        tiles=Dictionary()
        
        //边长定义不太理解
        let sideLength = padding + CGFloat(dimension)*(width + padding)
        //cgrectmake 定点，左上角 宽 高
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
    
    //九宫格创建法
    //两个参数 一个是背景颜色一个是格子颜色
    func setBackground(backgroundColor bgColor: UIColor, tileColor: UIColor) {
        backgroundColor = bgColor
        var xCursor = tilePadding
        var yCursor: CGFloat
        let bgRadius = (cornerRadius > = 2) ? cornerRadius - 2 :0
        for i in 0..<dimension{
            yCursor = tilePadding
            for j in 0..<dimension{
                //draw dech tile
                let background = UIView(frame: CGRectMake(xCursor, yCursor, tileWidth, tileWidth))
                background.layer.cornerRadius = bgRadius
                background.backgroundColor = bgColor
                addSubview(background)
                yCursor = tileWidth+tilePadding
            }
            xCursor += tilePadding+tileWidth
            
        }
    }
    
    func insertTiles(pos: (Int,Int), value: Int){
        assert(positionIsVaild(pos))
        let (row,col) = pos
        let x = tilePadding + CGFloat(col)*(tileWidth+tilePadding)
        let y = tilePadding + CGFloat(row)*(tileWidth+tilePadding)
        let r = (cornerRadius >= 2) ? cornerRadius-2 : 0
        
        //CGpoint 二维坐标的点。Tile函数可见其初始化
        let tile = Tile(position:CGPointMake(x, y), width:tileWidth, value: value, radius: r , delegate: provider)
        tile.layer.setAffineTransform(CGAffineTransformMakeScale(tilePoStartScale,tilePoStartScale))
        
        
        
    }
}



