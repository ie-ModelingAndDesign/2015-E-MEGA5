// Playground - noun: a place where people can play

import UIKit

// http://xavier.hateblo.jp/entry/2014/06/12/223346

// comment
/*
long
comment
*/

// variable (dont need type description)
var a = 1
// constant
let b = 3
// description type
var c: Int = 5

// print
print("Hello, Playground \(c)") // simplicity include variable
print("Hello, Playground "+String(c))// has line feed

// string
var myName = "walking" + " " + "Mask"
myName += " foooooooo"
// count string's length
// myName.count

// array
var numbers = [10, 20, 30, 40, 50]
var colors = ["red", "black", "white", "blue"]
var names = [String]() // empty array
// change a element
colors[0] = "pink"
// add a element
// http://stackoverflow.com/questions/24002733/add-an-element-to-an-array-in-swift
colors += ["gray"]
colors.append("yellow")
//
colors.count
for color in colors {
    print(color)
}

//dictionary
var petCounts = ["dogs":3, "cats":4]
var wordCounts = Dictionary<String, Int>() // empty hash
wordCounts["dogs"] = petCounts["dogs"]
wordCounts.count
wordCounts.keys
wordCounts.values
for (pet, count) in petCounts {
    print(pet + ":" + String(count))
}

// boolean
var endFlag : Bool = false
endFlag = true

// function

// set on/off func by kazuki nagamine
// alarmのon/offを表すswitchingFlag 初期状態はfalse
var switchingFlag = false;
// bool型の引数を受け取ってswitchingFlagの値を変えるsetOnOff
func setOnOff(flag : Bool){
    switchingFlag = flag; // on=true / off=false
    // test用にprint
    if switchingFlag {
        print("on")
    } else {
        print("off")
    }
}
// test
var test_flag = true
setOnOff(test_flag) // print "on\n"

