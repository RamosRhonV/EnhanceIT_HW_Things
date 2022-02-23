import UIKit

// mini exercises
// ME1 =================
let age1 = 42
let age2 = 21

// continues inferring to Int because all values
// are Int values
let avg1 = (age1 + age2) / 2

// infers to Double because the result of
// age1 + age2 has been casted to Double
let avg2 = Double((age1 + age2)) / 2.0
print("ME1: The average of age 1 and age 2 is \(avg2)")

// ME2 =================
let firstName = "Ulfric"
let lastName = "Stormcloak"

let fullName = firstName + " " + lastName

let myDetails = "Hello, my name is \(fullName)."
print("ME2: " + myDetails)

// ME3 =================
// creates a tuple of three Ints and a Double
var n = (3, 2, 1.0, 6.9)

// names each value in the tuple
n = (month: 3, day: 2, year: 1.0, averageTemperature: 6.9)

// assigns tuple values into two constants
let (_, x, _, y) = n
print("(\(x), \(y))")

// Challenges Section
// C1
let coordinates = (2, 3)

// C2
let namedCoordinate = (row: coordinates.0, columns: coordinates.1)

// C3

// let characterA: Character = "Dog" -> invalid, attempts to initialize a String
// let characterDog: Character = "<dog emoji>" -> valid, single emojis are acceptable
// let stringDog: String = "Dog" -> valid, any number of characters is allowed
// let stringDog:String = "<dog emoji>" -> valid, single emojis are considered single letter Strings

// C4
let tuple = (day: 15, month: 8, year: 2015)
// let day = tuple.Day -> invalid, would point to a Day object instead of the day label
let day = tuple.day

// C5
// let name = "Matt" -> invalid, let is an immutable variable
var name = "Matt"
name += " Galloway"

// C6
let tuple1 = (100, 1.5, 10)
let value = tuple1.1 // variable value has the type Double

// C7
let tuple2 = (day: 15, month: 8, year: 2015)
let month1 = tuple2.month // the value of month1 is 8

// C8
let num1 = 10
let mult1 = 5
let summary = "\(num1) multiplied by \(mult1) equals \(num1 * mult1)."
print("C8: " + summary)

// C9
let a = 4
let b:Int32 = 100
let c:UInt8 = 12
let res = Int(a) + Int(b) - Int(c)
print("Result = " + String(res))

// C10
let dPi = Double.pi
let fPi = Float.pi

// Float has 16 digits while Double has only 8 digits
// this means that pi shown through a Float variable is more accurate
print("\(dPi)\n\(fPi)")
