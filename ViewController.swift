//
//  ViewController.swift
//  aaaaa
//
//  Created by Masataka on 2015/12/02.
//  Copyright © 2015年 MEGA-5. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBOutlet weak var WeekSwitch: UISwitch!
    @IBAction func WeekAction(sender: UISwitch) {
        if WeekSwitch.on{
            MonSwitch.enabled=true
            TueSwitch.enabled=true
            WedSwitch.enabled=true
            ThursSwitch.enabled=true
            FriSwitch.enabled=true
            SatSwitch.enabled=true
            SunSwitch.enabled=true
        } else {
            MonSwitch.enabled=false
            TueSwitch.enabled=false
            WedSwitch.enabled=false
            ThursSwitch.enabled=false
            FriSwitch.enabled=false
            SatSwitch.enabled=false
            SunSwitch.enabled=false
        }
    }
    @IBOutlet weak var MonSwitch: UISwitch!
    @IBAction func MonAction(sender: UISwitch) {
        if MonSwitch.on {
            var Mon:Bool = true
            print("Monday.true")
        } else {
            var Mon:Bool = false
            print("Monday.false")
        }
    }
    
    @IBOutlet weak var TueSwitch: UISwitch!
    @IBAction func TueAction(sender: UISwitch) {
        if TueSwitch.on {
            var Tue:Bool = true
            print("Tuesday.true")
        } else {
            var Tue:Bool = false
            print("Tuesday.false")
        }
    }
    @IBOutlet weak var WedSwitch: UISwitch!
    @IBAction func WedAction(sender: UISwitch) {
        if WedSwitch.on {
            var Wed:Bool = true
            print("Wednesday.true")
        } else {
            var Wed:Bool = false
            print("Wednesday.false")
        }
    }
    
    @IBOutlet weak var ThursSwitch: UISwitch!
    @IBAction func ThursAction(sender: UISwitch) {
        if ThursSwitch.on {
            var Thurs:Bool = true
            print("Thursday.true")
        } else {
            var Thurs:Bool = false
            print("Thursday.false")
        }
    }
    
    @IBOutlet weak var FriSwitch: UISwitch!
    @IBAction func FriAction(sender: UISwitch) {
        if FriSwitch.on {
            var Fri:Bool = true
            print("Friday.true")
        } else {
            var Fri:Bool = false
            print("Friday.false")
        }
    }
    
    @IBOutlet weak var SatSwitch: UISwitch!
    @IBAction func SatAction(sender: UISwitch) {
        if SatSwitch.on {
            var Sat:Bool = true
            print("Saturday.true")
        } else {
            var Sat:Bool = false
            print("Saturday.false")
        }
    }
    
    @IBOutlet weak var SunSwitch: UISwitch!
    @IBAction func SunAction(sender: UISwitch)
    {
        if SunSwitch.on {
            var Sun:Bool = true
            print("Sunday.true")
        } else {
            var Sun:Bool = false
            print("Sunday.false")
        }
    }
    
    
    
}

