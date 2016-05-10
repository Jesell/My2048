//
//  ViewController.swift
//  My2048
//
//  Created by Jesell on 16/5/11.
//  Copyright © 2016年 Jesell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stat_gameTrapped(sender: UIButton){
        
        let game=GameViewController(dimension: 8, threshold:2048)
        self.presentViewController(game, animated: true, completion: nil)
        
    }

}

