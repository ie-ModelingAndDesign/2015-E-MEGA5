//
//  ViewController.swift
//  aaaaa
//
//  Created by Masataka on 2015/12/02.
//  Copyright © 2015年 MEGA-5. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // get NSUserDefaults instance
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initialization
        initialize()
        // schedule manager
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // IB variables
    // set button
    @IBOutlet weak var SetButton: UIBarButtonItem!
    // on/off button
    @IBOutlet weak var onOffSwitch: UISwitch!
    // week buttons
    @IBOutlet weak var MonSwitch: UISwitch!
    @IBOutlet weak var TueSwitch: UISwitch!
    @IBOutlet weak var WedSwitch: UISwitch!
    @IBOutlet weak var ThuSwitch: UISwitch!
    @IBOutlet weak var FriSwitch: UISwitch!
    @IBOutlet weak var SatSwitch: UISwitch!
    @IBOutlet weak var SunSwitch: UISwitch!
    // date pickers
    @IBOutlet weak var start_dp: UIDatePicker!
    @IBOutlet weak var stop_dp: UIDatePicker!
    
    // uniqueness variables
    // setting variables
    private var onOffStatus: Bool = false
    private var startTime: String = "0000"
    private var stopTime: String = "0000"
    // weekFlags
    private var weekFlags = [false, false, false, false, false, false, false]
    // important variables
    private var alertFlag: Bool = false
    private var weekday: Int = 99
    // temp variables
    private var tempStartTime: String = "0000"
    private var tempStopTime: String = "0000"
    private var tempWeekFlags = [false, false, false, false, false, false, false]
    // let variables
    private let format: String = "HHmm"
    
    // IB functions
    // setting function
    @IBAction func setting(sender: AnyObject) {
        // set date format
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        startTime = formatter.stringFromDate(start_dp.date)
        stopTime = formatter.stringFromDate(stop_dp.date)
        weekFlags = tempWeekFlags
        print("weekFlags: \(weekFlags)")
        print("tempWeekFlags: \(tempWeekFlags)")
        // store vars to NSUserDefaults
        defaults.setObject(startTime, forKey: "startTime")
        defaults.setObject(stopTime, forKey: "stopTime")
        for i in 0...6 { defaults.setObject(weekFlags[i], forKey: "weekFlags\(i)") }
        let successful = defaults.synchronize()
        if successful {
            print("succeeded to store data!")
        }
        // test print
        print("settign complete!")
    }
    // on/off function
    @IBAction func onOffAction(sender: AnyObject) {
        onOffStatus=onOffSwitch.on
        changeButtonState()
        // store var to NSUserDefaults
        defaults.setObject(onOffStatus, forKey: "onOffStatus")
        let successful = defaults.synchronize()
        if successful {
            print("succeeded to store data!")
        }
        // test print
        print("App \(onOffStatus)")
        
    }
    // week button functions
    @IBAction func SunAction(sender: UISwitch) {
        changeWeekFlagState(0, button: SunSwitch)
        // test print
        print("Sunday is \(tempWeekFlags[0])")
    }
    @IBAction func MonAction(sender: UISwitch) {
        changeWeekFlagState(1, button: MonSwitch)
        // test print
        print("Monday is \(tempWeekFlags[1])")
    }
    @IBAction func TueAction(sender: UISwitch) {
        changeWeekFlagState(2, button: TueSwitch)
        // test print
        print("Tueday is \(tempWeekFlags[2])")
    }
    @IBAction func WedAction(sender: UISwitch) {
        changeWeekFlagState(3, button: WedSwitch)
        // test print
        print("Wedday is \(tempWeekFlags[3])")
    }
    @IBAction func ThuAction(sender: UISwitch) {
        changeWeekFlagState(4, button: ThuSwitch)
        // test print
        print("Thuday is \(tempWeekFlags[4])")
    }
    @IBAction func FriAction(sender: UISwitch) {
        changeWeekFlagState(5, button: FriSwitch)
        // test print
        print("Friday is \(tempWeekFlags[5])")
    }
    @IBAction func SatAction(sender: UISwitch) {
        changeWeekFlagState(6, button: SatSwitch)
        // test print
        print("Satday is \(tempWeekFlags[6])")
    }
    @IBAction func start_dp_func(sender: AnyObject) {
        // set date format
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        // set date to temp var
        tempStartTime = formatter.stringFromDate(start_dp.date)
        // test print
        print("tempStartTime: \(tempStartTime)")
    }
    @IBAction func stop_dp_func(sender: AnyObject) {
        // set format
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        // set date to temp var
        tempStopTime = formatter.stringFromDate(stop_dp.date)
        // test print
        print("tempStopTime: \(tempStopTime)")
    }
    
    // uniqueness functions
    // initialize uniqueness variables funciton
    func initialize() {
        // initialize other vars with NSUserDefault
        onOffStatus = defaults.objectForKey("onOffStatus") as! Bool
        onOffSwitch.on = onOffStatus
        for i in 0...6 { weekFlags[i] = defaults.objectForKey("weekFlags\(i)") as! Bool }
        SunSwitch.on = weekFlags[0]
        MonSwitch.on = weekFlags[1]
        TueSwitch.on = weekFlags[2]
        WedSwitch.on = weekFlags[3]
        ThuSwitch.on = weekFlags[4]
        FriSwitch.on = weekFlags[5]
        SatSwitch.on = weekFlags[6]
        changeButtonState()
        startTime = defaults.objectForKey("startTime") as! String
        stopTime = defaults.objectForKey("stopTime") as! String
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        start_dp.date = formatter.dateFromString(startTime)!
        stop_dp.date = formatter.dateFromString(stopTime)!
        // initialize temp variables
        tempStartTime = startTime
        tempStopTime = stopTime
        tempWeekFlags = weekFlags
        getNowTime() // initialize weekday
        // test print
        print("onOffStatus: \(onOffStatus)")
        print("startTime: \(startTime)")
        print("stopTime: \(stopTime)")
        print("weekFlags: \(weekFlags)")
        print("tempStartTime: \(tempStartTime)")
        print("tempStopTime: \(tempStopTime)")
        print("tempWeekFlags: \(tempWeekFlags)")
        print("initialized!!")
    }
    // get now date function
    func getNowTime()-> String {
        // gat now date
        let nowTime: NSDate = NSDate()
        // set format
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        // get weekday as int
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierJapanese)!
        let myComponents = myCalendar.components(.Weekday, fromDate: nowTime)
        weekday = myComponents.weekday
        // return formated date
        return formatter.stringFromDate(nowTime)
    }
    //
    func update() {
        // if alert time then ...
        setAlertFlag(getNowTime())
        if alertFlag { alert() }
    }
    // alarm func
    func setAlertFlag(str: String) {
        if onOffStatus && weekFlags[weekday-1] {
            if str == startTime { alertFlag = true }
            if str == stopTime { alertFlag = false }
        }
    }
    // output alert func
    func alert() {
        // for test
        alertFlag = false
        // set alert
        let myAlert = UIAlertController(title: "alert", message: "ring ding", preferredStyle: .Alert)
        let myAction = UIAlertAction(title: "dong", style: .Default) {
            action in print("foo!!")
        }
        myAlert.addAction(myAction)
        // output
        presentViewController(myAlert, animated: true, completion: nil)
    }
    //
    func changeButtonState(){
        MonSwitch.enabled=onOffSwitch.on
        TueSwitch.enabled=onOffSwitch.on
        WedSwitch.enabled=onOffSwitch.on
        ThuSwitch.enabled=onOffSwitch.on
        FriSwitch.enabled=onOffSwitch.on
        SatSwitch.enabled=onOffSwitch.on
        SunSwitch.enabled=onOffSwitch.on
    }
    //
    func changeWeekFlagState(i: Int, button: UISwitch) {
        tempWeekFlags[i] = button.on ? true : false
        print("tempWeekFlags\(i): \(tempWeekFlags[i])")
        print("tempWeekFlags: \(tempWeekFlags)")
    }
}