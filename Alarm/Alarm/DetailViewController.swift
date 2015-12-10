//
//  DetailViewController.swift
//  Alarm
//
//  Created by kazuki nagamine on 11/12/15.
//  Copyright © 2015 MEGA5. All rights reserved.
//

import UIKit

startApp(){
    
    FILE fp;
    fp=open();
    fp=coles();
}

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var myLabel: UILabel!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        nowTime()
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        let str = nowTime()
        myAlarm(str)
    }
    
    func nowTime()->String {
        //現在時刻を取得.
        let myDate: NSDate = NSDate()
        
        //カレンダーを取得.
        let myCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        
        //取得するコンポーネントを決める.
        let myComponents = myCalendar.components([.Hour, .Minute, .Second, .Weekday],
            fromDate: myDate)
        
        // 曜日表記を用意.
        let weekdayStrings: Array = ["nil","SUN","MON","TUE","WED","THU","FRI","SAT","SUN"]
        
        //現在時間表示用の文字列を生成.
        var myStr: String = "\(myComponents.hour):"
        myStr += "\(myComponents.minute):"
        myStr += "\(myComponents.second) "
        myStr += "\(weekdayStrings[myComponents.weekday])"
        myLabel.text = myStr
        
        // 文字列を返す
        return myStr
    }
    
    func myAlarm(myStr: String) {
<<<<<<< Updated upstream
        if(myStr=="15:51:45 WED"){
=======
        if(myStr=="11:09:40 WED"){
>>>>>>> Stashed changes
            choiceBtn()
        }
    }
    
    func choiceBtn() {
        let alertController = UIAlertController(title: "緊急・妥協用", message: "妥協しますか？", preferredStyle: .Alert)
        let otherAction = UIAlertAction(title: "Yes", style: .Default) {
            action in print("Yes")
        }
        alertController.addAction(otherAction)
        presentViewController(alertController, animated: true, completion: nil)
    }



}

