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
    var tiles: Dictionary<NSIndexPath, Tile>
    
    let provider = Appearance()
    
    let tilePoStartScale: CGFloat = 1.0
    let tileMergeExpandTime: NSTimeInterval= 0.08
    let tileMergeContractTime: NSTimeInterval
    
}



