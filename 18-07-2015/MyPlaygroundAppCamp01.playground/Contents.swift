//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let x = 2
var suma = 0

for i in 1...100{
println(i)
   suma += i
    
}
println(suma)

let label = UILabel (frame: CGRect(x: 0, y: 0, width: 300, height: 50))

label.backgroundColor = UIColor.redColor()

label.text = ("suma wynosi: \(suma)")