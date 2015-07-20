//: Playground - noun: a place where people can play

import UIKit

enum Colors {
    case RGB(CGFloat, CGFloat, CGFloat)
    case CMYK(Int,Int, Int, Int)
}

var color = Colors.RGB(0.7, 0.2, 0.7)

color = .CMYK(25, 25, 25, 25)

var label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 15))

label.text = "Hello"
switch color{
case .RGB(let r, let g, let b): label.textColor = UIColor(red: r, green: g, blue: b, alpha: 1)
default: label.textColor = UIColor.blackColor()
}

