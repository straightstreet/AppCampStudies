//: Playground - noun: a place where people can play

import UIKit

func printText(text: String) {
    println(text)
}

printText("Hello")
printText("Mug")

func printText(text: String, times: Int){
    for i in 1...times{
        println(text)
    }
}

printText("hello1", 2)

func printText2(#text: String, #times: Int){
    for i in 1...times{
        println(text)
    }
}

printText2(text: "hello2", times: 2)

func printText3(text t: String, times n: Int){
    for i in 1...n{
        println(t)
    }
}

printText3(text: "hello3", times: 2)
