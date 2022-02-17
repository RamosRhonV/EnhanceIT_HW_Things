import UIKit

// find the longest common prefix string amongst
// an array of strings
// if there is no common prefix, return an
// empty string

// example String arrays
var strs1 = ["flower", "flow", "flight"]
var strs2 = ["dog", "racecar", "car"]
var strs3 = ["crazy", "razy", "lazy", "crash", "cash"]
var strs4 = ["lazy", "laugh", "lagrange", "language"]

// function accepts two String parameters
// returns a String
func findCommonPrefix(str1:String, str2:String) -> String {
    
    // holds resulting prefix if it exists
    var commonPref = ""
    
    // num1 and num2 hold the length of the Strings
    let num1 = str1.count, num2 = str2.count
    
    // counter1 and counter2 act as indices for both Strings
    var counter1 = 0, counter2 = 0
    
    // iterates until either counter reaches the length of a string minus 1
    while(counter1 <= num1 - 1 && counter2 <= num2 - 1) {
        
        // letter1 and letter2 holds a specific character of their respective Strings
        // for the current iteration
        let letter1 = str1[str1.index(str1.startIndex, offsetBy: counter1)]
        let letter2 = str2[str2.index(str2.startIndex, offsetBy: counter2)]
        
        // if letter1 and letter2 are not identical, break the loop
        if(letter1 != letter2) {
            break
        }
        
        // else the character of letter1 to the commonPref String
        // this is the common prefix
        commonPref.append(letter1)
        
        // increment counter1 and counter2
        counter1 += 1
        counter2 += 1
    }
    
    // if the resulting commonPref String is empty, return this message
    if(commonPref.isEmpty) {
        return "There is no common prefix among the input strings."
    }
    
    // returns the commonPref String
    return commonPref
}

// function accepts a String array and an Integer parameter
// returns a String
func checkCommonPrefix(strs:[String], counter:Int) -> String {
    
    // holds the first element in the String array
    var pref = strs[0]
    
    var x = 0
    
    // iterates until x equals the counter Integer
    while(x <= counter - 1) {
        
        // calls the findCommonPrefix func
        // iterates through each of its own elements
        pref = findCommonPrefix(str1: pref, str2: strs[x])
        x += 1
    }
    
    // returns the longest common prefix present in all of the
    // String array's elements
    return pref
}

// test cases
print(checkCommonPrefix(strs: strs1, counter: strs1.count))
print(checkCommonPrefix(strs: strs2, counter: strs2.count))
print(checkCommonPrefix(strs: strs3, counter: strs3.count))
print(checkCommonPrefix(strs: strs4, counter: strs4.count))
