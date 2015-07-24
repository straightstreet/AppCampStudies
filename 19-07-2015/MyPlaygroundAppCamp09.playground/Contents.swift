
import UIKit

enum Colors {
    case RGB(CGFloat, CGFloat, CGFloat)
    case CMYK(Int,Int, Int, Int)
    
    func description() -> String {
        switch self {
        case let .RGB(r,g,b): return "R: \(r) G: \(g) B: \(b)"
        case let .CMYK(c,m,y,k): return "C: \(c)% M: \(m)% Y: \(y)% K: \(k)%"}
    
    }
    
    mutating func addSmth(v: CGFloat){
        switch self{
        case var .RGB (r,g,b): return self = RGB(r+v,g,b)
        case let .CMYK(c,m,y,k): return self = CMYK(c+Int(v) ,m,y,k)
        }
    }
}

var color = Colors.RGB(0.7, 0.2, 0.7)

color = .CMYK(25, 25, 25, 25)

var label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 15))

label.text = "Hello"
switch color{
case .RGB(let r, let g, let b): label.textColor = UIColor(red: r, green: g, blue: b, alpha: 1)
default: label.textColor = UIColor.blackColor()
}

color.addSmth(6)
println("\(color.description())")

//==================================

enum ASCIIControlCharacters: Character{
case Tab = "\t"
}
let c = ASCIIControlCharacters.Tab.rawValue
println("hello, \(c) else")

enum PlayingCards: Int{
    case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King, Ace = 1
}

PlayingCards.Two.rawValue
PlayingCards.Three.rawValue

let card = PlayingCards(rawValue: 5)
card?.rawValue

if let value = card?.rawValue{
//sprawdzi nam nila
}
