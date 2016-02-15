//
//  ViewController.swift
//  aaaaa
//
//  Created by Masataka on 2015/12/02.
//  Copyright © 2015年 MEGA-5. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Get the NSUserDefaults instance
    let defaults = NSUserDefaults.standardUserDefaults()
    
    // Main rutine
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // connect UIPickerView
        self.myPicker.delegate = self
        self.myPicker.dataSource = self
        
        
        //ホーム画面に戻ろうとしたとき用
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(
            self,
            selector: "func1",
            name:UIApplicationDidEnterBackgroundNotification,
            object: nil)
        
        // Initialization
        initialize()
        
        // The schedule manager
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ホーム画面に戻ろうとしたとき用関数
    func func1(){
        if alertStatus {
            let notification = UILocalNotification()
            notification.alertBody = "You're really bummer..."
            UIApplication.sharedApplication().presentLocalNotificationNow(notification)
            UIApplication.sharedApplication().presentLocalNotificationNow(notification)
            UIApplication.sharedApplication().presentLocalNotificationNow(notification)
            UIApplication.sharedApplication().presentLocalNotificationNow(notification)
            UIApplication.sharedApplication().presentLocalNotificationNow(notification)
            UIApplication.sharedApplication().presentLocalNotificationNow(notification)
            UIApplication.sharedApplication().presentLocalNotificationNow(notification)
            UIApplication.sharedApplication().presentLocalNotificationNow(notification)
            UIApplication.sharedApplication().presentLocalNotificationNow(notification)
        }
    }
    
    // IB variables
    
    // The set button
    @IBOutlet weak var SetButton: UIBarButtonItem!
    
    // The On/Off button
    @IBOutlet weak var onOffSwitch: UISwitch!
    
    // Week buttons
    @IBOutlet weak var MonSwitch: UISwitch!
    @IBOutlet weak var TueSwitch: UISwitch!
    @IBOutlet weak var WedSwitch: UISwitch!
    @IBOutlet weak var ThuSwitch: UISwitch!
    @IBOutlet weak var FriSwitch: UISwitch!
    @IBOutlet weak var SatSwitch: UISwitch!
    @IBOutlet weak var SunSwitch: UISwitch!
    
    // Date pickers
    @IBOutlet weak var start_dp: UIDatePicker!
    @IBOutlet weak var stop_dp: UIDatePicker!
    
    // Picker
    @IBOutlet weak var myPicker: UIPickerView!
    
    
    // Uniqueness variables
    
    // Setting variables
    private var onOffStatus: Bool = false
    private var startTime: String = "0000"
    private var stopTime: String = "0000"
    
    // WeekFlags
    private var weekFlags = [false, false, false, false, false, false, false]
    
    // Alert function's variables
    private var weekday: Int = 99
    private var rnd_str: NSString = ""
    private var ans_str: String? = ""
    private var initRandStringLen = 0
    private var remaningNum = 0
    private var strLen = 0
    private var remaning = 0
    private let myAlert = UIAlertController(title: "Sleep alert", message: "exit", preferredStyle: .Alert)
    
    // Temp variables
    private var tempStartTime: String = "0000"
    private var tempStopTime: String = "0000"
    private var tempWeekFlags = [false, false, false, false, false, false, false]
    private var tempRandStringLen = 0
    private var tempRemaningNum = 0
    private var alertStatus = false
    
    // Formating variables
    private let formatter = NSDateFormatter()
    private let format: String = "HHmm"
    private let pickerData = [[10,20,30,40,50],[1,2,3,4,5]]
    
    // IB functions
    
    // The setting function
    @IBAction func setting(sender: AnyObject) {
        
        // Get a temporary variable
        startTime = formatter.stringFromDate(start_dp.date)
        stopTime = formatter.stringFromDate(stop_dp.date)
        weekFlags = tempWeekFlags
        initRandStringLen = tempRandStringLen
        remaningNum = tempRemaningNum
        
        alertStatus = false
        
        // Store vars to NSUserDefaults
        defaults.setObject(startTime, forKey: "startTime")
        defaults.setObject(stopTime, forKey: "stopTime")
        for i in 0...6 { defaults.setObject(weekFlags[i], forKey: "weekFlags\(i)") }
        defaults.setObject(initRandStringLen, forKey: "initRandStringLen")
        defaults.setObject(remaningNum, forKey: "remaningNum")
        let successful = defaults.synchronize()
        if successful {
            print("succeeded to store data!")
        }
        
        // Confirmation alert
        let set_alert: UIAlertController = UIAlertController(title: "", message: "Setting complete!", preferredStyle: .Alert)
        self.presentViewController(set_alert, animated: true) { () -> Void in
            let delay = 0.1 * Double(NSEC_PER_SEC)
            let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue(), {
                self.dismissViewControllerAnimated(true, completion: nil)
            })
        }
        
        // Test print
        print("weekFlags: \(weekFlags)")
        print("tempWeekFlags: \(tempWeekFlags)")
        print("settign complete!")
    }
    
    // The On/Off function
    @IBAction func onOffAction(sender: AnyObject) {
        
        onOffStatus=onOffSwitch.on
        changeButtonState()
        
        // Store the variable to the NSUserDefaults
        defaults.setObject(onOffStatus, forKey: "onOffStatus")
        let successful = defaults.synchronize()
        if successful {
            print("succeeded to store data!")
        }
        
        // Test print
        print("App \(onOffStatus)")
        
    }
    
    // Week button functions
    @IBAction func SunAction(sender: UISwitch) {
        changeWeekFlagState(0, button: SunSwitch)
        // Test print
        print("Sunday is \(tempWeekFlags[0])")
    }
    @IBAction func MonAction(sender: UISwitch) {
        changeWeekFlagState(1, button: MonSwitch)
        // Test print
        print("Monday is \(tempWeekFlags[1])")
    }
    @IBAction func TueAction(sender: UISwitch) {
        changeWeekFlagState(2, button: TueSwitch)
        // Test print
        print("Tueday is \(tempWeekFlags[2])")
    }
    @IBAction func WedAction(sender: UISwitch) {
        changeWeekFlagState(3, button: WedSwitch)
        // Test print
        print("Wedday is \(tempWeekFlags[3])")
    }
    @IBAction func ThuAction(sender: UISwitch) {
        changeWeekFlagState(4, button: ThuSwitch)
        // Test print
        print("Thuday is \(tempWeekFlags[4])")
    }
    @IBAction func FriAction(sender: UISwitch) {
        changeWeekFlagState(5, button: FriSwitch)
        // Test print
        print("Friday is \(tempWeekFlags[5])")
    }
    @IBAction func SatAction(sender: UISwitch) {
        changeWeekFlagState(6, button: SatSwitch)
        // Test print
        print("Satday is \(tempWeekFlags[6])")
    }
    
    // Datepicker functions
    @IBAction func start_dp_func(sender: AnyObject) {
        
        // Set a date to the temp var
        tempStartTime = formatter.stringFromDate(start_dp.date)
        
        // Test print
        print("tempStartTime: \(tempStartTime)")
    }
    @IBAction func stop_dp_func(sender: AnyObject) {
        
        // Set a date to the temp var
        tempStopTime = formatter.stringFromDate(stop_dp.date)
        
        // Test print
        print("tempStopTime: \(tempStopTime)")
    }
    
    // UIPicker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[0].count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerData[component][row])
    }
    // UIPicker function
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            self.tempRandStringLen = row
            print("tempRandStringLen: \(pickerData[0][tempRandStringLen])")
        } else {
            self.tempRemaningNum = row
            print("tempRemaningNum: \(pickerData[1][tempRemaningNum])")
        }
    }
    
    
    // Uniqueness functions
    
    // Initialize uniqueness variables
    func initialize() {
        
        // Initialize the format
        self.formatter.dateFormat = format // HHmm
        
        // Initialize other vars with the NSUserDefault
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
        start_dp.date = formatter.dateFromString(startTime)!
        stop_dp.date = formatter.dateFromString(stopTime)!
        initRandStringLen = defaults.objectForKey("initRandStringLen") as! Int
        remaningNum = defaults.objectForKey("remaningNum") as! Int
        myPicker.selectRow(initRandStringLen, inComponent: 0, animated: false);
        myPicker.selectRow(remaningNum, inComponent: 1, animated: false);
        
        // Initialize temp variables
        tempStartTime = startTime
        tempStopTime = stopTime
        tempWeekFlags = weekFlags
        tempRandStringLen = initRandStringLen
        tempRemaningNum = remaningNum
        
        alertStatus = false
        
        initAlert() // Initialize UIAlertControler
        getNowTime() // Initialize weekday
        
        // Test print
        print("onOffStatus: \(onOffStatus)")
        print("startTime: \(startTime)")
        print("stopTime: \(stopTime)")
        print("weekFlags: \(weekFlags)")
        print("tempStartTime: \(tempStartTime)")
        print("tempStopTime: \(tempStopTime)")
        print("tempWeekFlags: \(tempWeekFlags)")
        print("tempRemaningLen: \(tempRandStringLen)")
        print("tempRemaningNum: \(tempRemaningNum)")
        print("initialized!!")
    }
    
    // Alert functions
    
    // Check whether the time to alert
    func update() {
        setAlert(getNowTime())
    }
    
    // Get the formated current date
    func getNowTime()-> String {
        
        // Gat the current date
        let nowTime: NSDate = NSDate()
        
        // Set a local format for the Alerm function
        let local_formatter = NSDateFormatter()
        local_formatter.dateFormat = "HHmmss"
        
        // Get the weekday as integer
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierJapanese)!
        let myComponents = myCalendar.components(.Weekday, fromDate: nowTime)
        weekday = myComponents.weekday
        
        // Return the formated date
        return local_formatter.stringFromDate(nowTime)
    }
    
    // Initialize the Alert settings
    func initAlert() {
        
        // Add a text field to the Alert
        myAlert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.clearsOnBeginEditing = true
            textField.placeholder = "text is here"
        })
        
        // Add a action to the Alert
        myAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            let textField = self.myAlert.textFields![0] as UITextField
            self.ans_str = textField.text
            self.resetAlert()
        }))
        
        // Set the counts
        strLen = pickerData[0][initRandStringLen]
        remaning = pickerData[1][remaningNum]
    }
    
    // Comparing the input-text and random-text function
    func resetAlert() {
        if ans_str != rnd_str {
            setAlert("\(startTime)00") // Re-output the Alert
        }
        else{
            remaning-- // dicrease remaning number
            setAlert("\(startTime)00") // Re-output the Alert
        }
    }
    
    // Main of the Alerm
    func setAlert(str: String) {
        
        // Referenced
        // http://stackoverflow.com/questions/26567413/how-to-get-input-value-from-textfield-in-alert
        
        // Start
        if str == "\(startTime)00" {
            
            // Set the counts
            strLen = pickerData[0][initRandStringLen]
            remaning = pickerData[1][remaningNum]
            
            // Get a random string
            rnd_str = randomStringWithLength (strLen)
            
            // Enable the alert
            myAlert.message = "Enter the text below. (remaining... \(remaning))\n\(rnd_str)"
            presentViewController(myAlert, animated: true, completion: nil)
            
            alertStatus = true
            
            // Test print
            print("Alert started!")
            print(rnd_str)
            
            // Stop
        } else if str == "\(stopTime)00" || remaning == 0 {
            
            // Disable the alert
            myAlert.message = "exit"
            myAlert.dismissViewControllerAnimated(true, completion: nil)
            
            alertStatus = false
            
            // Test print
            print("Alert stoped!")
        }
    }
    
    // Generate a random string for the alert function
    func randomStringWithLength (len : Int) -> NSString {
        // Referenced
        // http://stackoverflow.com/questions/26845307/generate-random-alphanumeric-string-in-swift
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString : NSMutableString = NSMutableString(capacity: len)
        for (var i=0; i < len; i++){
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        return randomString
    }
    
    // Chenge some state functions
    
    // Change a button.enabled with the onOffSwitch state
    func changeButtonState(){
        MonSwitch.enabled=onOffSwitch.on
        TueSwitch.enabled=onOffSwitch.on
        WedSwitch.enabled=onOffSwitch.on
        ThuSwitch.enabled=onOffSwitch.on
        FriSwitch.enabled=onOffSwitch.on
        SatSwitch.enabled=onOffSwitch.on
        SunSwitch.enabled=onOffSwitch.on
    }
    
    // Change tempweekFlags with the weekButton
    func changeWeekFlagState(i: Int, button: UISwitch) {
        tempWeekFlags[i] = button.on ? true : false
        print("tempWeekFlags\(i): \(tempWeekFlags[i])")
        print("tempWeekFlags: \(tempWeekFlags)")
    }
}