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
    let tileMergeStartScale : CGFloat = 1.0
    let tileMergeExpandTime : NSTimeInterval = 0.08
    let tileMergeContractTime : NSTimeInterval = 0.08
    
    let tilePopStartScale: CGFloat = 0.1
    let tilePopMaxScale: CGFloat = 1.1
    let tilePopDelay: NSTimeInterval = 0.05
    let tileExpandTime: NSTimeInterval = 0.18
    let tileContractTime: NSTimeInterval = 0.08
    
    
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
        //cgrectmake x坐标 y坐标 宽 高
        super.init(frame: CGRectMake(0, 0, sideLength, sideLength))
        layer.cornerRadius = radius
        //九宫格布局创建方法
        setBackground(backgroundColor: backgroundColor, tileColor: foregroundColor)
        
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
    
    //判断点是否是有效的点
    func positionIsVaild(pos: (Int,Int))-> Bool {
        let (x,y) = pos
        return(x >= 0 && x < dimension && y >= 0 && y < dimension)
    }
    
    //九宫格创建法
    //两个参数 一个是背景颜色一个是格子颜色
    func setBackground(backgroundColor bgColor: UIColor, tileColor: UIColor) {
        backgroundColor = bgColor
        var xCursor = tilePadding
        var yCursor: CGFloat
        let bgRadius = (cornerRadius >= 2) ? (cornerRadius - 2) : 0
        for i in 0..<dimension{
            yCursor = tilePadding
            //dimension代表矩阵的大小
            for j in 0..<dimension{
            //画出每个格子
            let background = UIView(frame: CGRectMake(xCursor, yCursor, tileWidth,tileWidth))
                background.layer.cornerRadius = bgRadius
                background.backgroundColor = tileColor
                addSubview(background)
                yCursor += tilePadding + tileWidth
            }
            xCursor += tilePadding+tileWidth
            
        }
    }
    
    //插入新的格子
    func insertTiles(pos: (Int,Int), value: Int){
        //使用断言进行异常处理
        assert(positionIsVaild(pos))
        
        let (row,col) = pos
        let x = tilePadding + CGFloat(col)*(tileWidth+tilePadding)
        let y = tilePadding + CGFloat(row)*(tileWidth+tilePadding)
        let r = (cornerRadius >= 2) ? cornerRadius-2 : 0
        
        //CGpoint 二维坐标的点。Tile函数可见其初始化
        let tile = Tile(position:CGPointMake(x, y), width:tileWidth, value: value, radius: r , delegate: provider)
        tile.layer.setAffineTransform(CGAffineTransformMakeScale(tilePopStartScale,tilePopStartScale))
        
        addSubview(tile)
        bringSubviewToFront(tile)
        tiles[NSIndexPath(forRow: row, inSection: col)] = tile
        
        //add to the board
        UIView.animateWithDuration(tileExpandTime, delay: tilePopDelay, options:UIViewAnimationOptions.TransitionNone,
            animations:
                {
                    () ->Void in
            //make tile 'pop'
                    tile.layer.setAffineTransform(CGAffineTransformMakeScale(self.tilePopMaxScale, self.tilePopStartScale))
                },
            completion: {( finished: Bool) -> Void in
            //Shrink the tile after it 'pops'
                UIView.animateWithDuration(self.tileContractTime, animations:{ ()->Void in
                    tile.layer.setAffineTransform(CGAffineTransformIdentity)
                    })
        })
        
        //Update the gameboard by moving a single tile from one location to another. if the move is going to collapse two 
        //tiles into a new tile , the tile will 'pop' after moving to its new location
        
        
        
        
        
    }
}



