//
//  ViewController.swift
//  start
//
//  Created by Goebuchi Munenori on 2015/11/25.
//  Copyright © 2015年 Goebuchi Munenori. All rights reserved.
//
import UIKit


class ViewController: UIViewController {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        //アプリがアクティブになったとき
        notificationCenter.addObserver(
            self,
            selector: "functionName",
            name:UIApplicationDidBecomeActiveNotification,
            object: nil)
        print("start")
        //        let filePath = "/path/to/data.csv"
        //        let data = NSString(contentsOfFile: filePath, encoding: NSUTF8StringEncoding, error: nil) as! String
        //        data.enumerateLines { (line, stop) -> () in
        //            println(line)
        //            let item: [String] = split( line, allowEmptySlices: true, isSeparator: { $0 == "," } )
        //            println(item)
        
        //        }
    }
    
    func functionName() {
        //コードを書く
    }
}


