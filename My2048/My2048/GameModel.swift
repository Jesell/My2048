//
//  GameModel.swift
//  My2048
//
//  Created by mac on 16/5/11.
//  Copyright © 2016年 Jesell. All rights reserved.
//

import UIKit

//主要是算法的实现(移动合并算法)

protocol  GameModelProtocol : class {
    func scoreChange(score: Int)
    func moveOneTtile(from: (Int, Int), to: (Int, Int), value: Int)
    func moveTwoTile(from: ((Int, Int), (Int, Int)), to: (Int, Int), value: Int)
    func insertTitle(location: (Int, Int), value: Int)
 }

class GameModel: NSObject {
    let dimensipon: Int
    let threshold: Int

    
    var score: Int = 0 {
        didSet {
            delegate.scoreChanged(score)
        }
    }
    
    var gameBoard: SquareGameBoard<TitleObject>
    
    let delegate: GameModelProtocol
    
    var queue: [moveCommand]
    var timer: NSTimer
    
    let maxCommands = 100
    let queueDelay = 0.3
    
    init(dimension d: Int, threshold t: Int, delegate: GameModelProtocol) {
        dimensipon = d
        threshold = t
        self.delegate = delegate
        queue = [moveCommand]()
            timer = NSTimer()
        gameboard = SquareGameboard(dimensipon: d, initvalue: .Empty)
        super.init()
    }
    
    func respect() {
        score = 0
        gameboard.setAll(.Empty)
        queue.removeAll(keepCapacity: true)
        timer.invalidate()
}
}
