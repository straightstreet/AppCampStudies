//: Playground - noun: a place where people can play

import UIKit

//optional//

var text: String? = "This is text"

text = nil

var label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 10))
label.text = "Text"
var labelText: String = label.text!
var text2 = text ?? "We want some text"
text2
