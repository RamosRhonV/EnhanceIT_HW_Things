import UIKit

// mini exercies
// ME1

let myAge = 10
let isTeenager:Bool = myAge >= 13 && myAge <= 19
//print(isTeenager)

let theirAge = 30
let bothTeenagers =
    (theirAge >= 13 && theirAge <= 19) &&
    (myAge >= 13 && myAge <= 19)
//print(bothTeenagers)

let reader = "Inni"
let author = "Matt Galloway"
let authorIsReader = reader == author
//print(authorIsReader)

let readerBeforeAuthor = reader < author
//print(readerBeforeAuthor)

// ME2
let myAge1 = 10
if myAge1 >= 13 && myAge1 <= 19 {
    //print("teenager")
}
else{
    //print("not a teenager")
}

let answer1 = myAge1 >= 13 && myAge <= 19 ? "teenager" : "nah"
//print(answer1)

// ME3
var count1 = 0
while(count1 < 10) {
    //print("counter is \(count1)")
    count1 += 1
}

var count2 = 0
var roll = 0
repeat {
    roll = Int.random(in: 0...5)
    count2 += 1
    //print("After \(count2) rolls, the roll is \(roll).")
} while (roll != 0)

// Challenges Section
// C1
let firstName = "Matt"

if firstName == "Matt" {
    let lastName = "Galloway"
}
else if firstName == "Ray" {
    let lastName = "Wenderlich"
}

// let fullName = firstName + " " + lastName -> invalid, lastName is inside the if-else statement scope

// C2
let ans1 = true && true // true
let ans2 = false || false // false
let ans3 = (true && 1 != 2) || (4 > 3 && 100 < 1) // true
let ans4 = ((10 / 2) > 3) && ((10 % 2) == 0) // true

// C3
let currentPos = 12
let diceRoll = 4
let finalPos = currentPos + diceRoll
var nextPos = 0

if finalPos == 3 {
    nextPos = 3
}
else if finalPos == 7 {
    nextPos = 7
}
else if finalPos == 11 {
    nextPos = 2
}
else if finalPos == 17 {
    nextPos = 9
}
else {
    nextPos = finalPos
}

//print(nextPos)

// C4
let month1 = "april"
let year1 = 2004

if month1 == "february" {
    if((year1 % 4 == 0 && !(year1 % 100 == 0)) || (year1 % 400 == 0)) {
        //print("29 days in this month")
    }
    else {
        //print("27 days in this month")
    }
}
else
{
    //print("31 or 30 days in this month")
}

// C5
let triN = 6
let triangleN = (triN * (triN + 1)) / 2
//print(triangleN)

// C6
var fibCount = 0
let fibDepth = 8
var fibN = 1
var fibPrev = 1
var fibSum = 0

while(fibCount < fibDepth) {
    fibSum = fibN + fibPrev
    fibPrev = fibN
    fibN = fibSum
    //print(fibN)
    fibCount += 1
}

// C8
var countT = 1
let timeT = 5

while(countT <= 12) {
    //print(5 * countT)
    countT += 1
}

// C9
for x in 1..<7 {
    for y in 1..<7 {
        print("\(x) + \(y) = \(x + y)")
    }
}
