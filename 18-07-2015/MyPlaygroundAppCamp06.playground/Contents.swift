//: Playground - noun: a place where people can play

import UIKit

class Person {
    var firstName: String
    var surName: String
    
    init (firstName: String, surName: String) {
        self.firstName = firstName
        self.surName = surName
    }
}

    struct PersonStruct {
        var firstName: String
        var lastName: String
    }
let p1 = Person (firstName: "Mack", surName: "Ten")
let p2 = p1

    println("P1 name is \(p1.firstName), P2 name is \(p2.firstName)")

p1.firstName = "Captain"

    println("P1 name is \(p1.firstName), P2 name is \(p2.firstName)")

//<===================>

var ps1 = PersonStruct(firstName: "Jack", lastName: "Sparrow")
var ps2 = ps1

    println("PS1 name is \(ps1.firstName), PS2 name is \(ps2.firstName)")

ps1.firstName = "Captain"

    println("PS1 name is \(ps1.firstName), PS2 name is \(ps2.firstName)")
