//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport
import Foundation

func countMoney( sumMoney: Int ) -> Int {
    var count = 0
    var moneyArray = [500, 100, 50, 10]
    var lastMoney = sumMoney
    
    for i in moneyArray {
        count += lastMoney/i
        lastMoney -= i*(lastMoney/i)
    }
    
    return count
}

countMoney(sumMoney: 1260)

// Present the view in Playground
//PlaygroundPage.current.liveView = views[0] as! NSView



func mirro (num: Int, direction: [String]) -> [Int] {
    var result = [1, 1]
    var x = [0, 0, -1, 1]
    var y = [-1, 1, 0, 0]
    var dictArray = ["L", "R", "U", "D"]
    
    for i in direction {
        var index = dictArray.firstIndex(of: i)!
        
        if result[0] + x[index]  > num || result[0] + x[index] < 1 || result[1] + y[index] > num || result[1] + y[index] < 1 {
        } else {
            
            result[0] += x[index]
            result[1] += y[index]
        }
    }
    
    return result
}

print(mirro(num: 5, direction: ["R", "R", "R", "U", "D", "D"]))



var stack = [Int]()

stack.append(2)
stack.append(4)
stack.append(5)
stack.removeFirst()
print(stack)
