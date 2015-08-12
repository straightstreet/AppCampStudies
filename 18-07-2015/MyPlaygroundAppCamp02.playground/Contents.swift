//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let cards = 52
var players = 4

players = 5

let arrayImmutable = ("one", "two", "three")

class Person {
    var firstName: String
    var surName: String
    
    init (firstName: String, surName: String) {
        self.firstName = firstName
        self.surName = surName
    }
}

let p1 = Person(firstName: "Marcin", surName: "Olczak")

//p1.firstName = "Captain"


var p2 = Person(firstName: "Marek", surName: "Olczak")

p2.surName = "new"

//p1 = p2 //sie nie da

p2 = p1 //sie da

