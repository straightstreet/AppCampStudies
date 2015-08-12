//: Playground - noun: a place where people can play

import UIKit

let names = ["Szymon","Anna","Piotr","Marta","Zbyszek","Kuba","Urszula"]

let shortNames = names.filter(){
    $0.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) < 5
}

func isShortName(name: String)-> Bool {
    return name.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) < 5
}


isShortName("Ala")
isShortName("Dominik")

func printNamesOfLength(names: [String], length: Int){
    
    let filteredNames = names.filter(){
        $0.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) < length
    }
    /*
        for (index, element) in enumerate(lengthNames) {
            println("Item \(index + 1): \(element)")
        }
    */
    println(filteredNames)
}

printNamesOfLength(names, 6)


//funkcja na dokładną liczbę//
func nameWithLength2(length: Int) ->String->Bool{
    return{(name: String) in return name.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) == length}
}

println(names.filter(nameWithLength2(5)))




