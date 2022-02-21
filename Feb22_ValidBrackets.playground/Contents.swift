import UIKit

/*
 * Return true or false for whether an input String
 * includes a valid set of brackets.
 * Brackets must be closed by the same type of Brackets.
 * Open Brackets must be closed in the correct order.
 * () [] {}
 * ( [] ) { [] }
 */

// example Strings
var s1 = "()"     // true
var s2 = "()[]{}" // true
var s3 = "(]"     // false
var s4 = ")([]"
var s5 = "(amIvalid)"
var s6 = "( ) [ ] { }"
var s7 = "(()){[()]}"
var s8 = "  ()  "


func checkValidBrackets (s:String) -> Bool {
    
    // trims whitespace and spaces between characters in input String
    let sTrimmed = String(s.trimmingCharacters(in: .whitespacesAndNewlines).filter{!" \n\t\r".contains($0)})
    
    // array of brackets
    let bracketSet:[String] = ["(",")","[","]","{","}"]
    
    // indices 0 and 1 are ( and )
    // indices 2 and 3 are [ and ]
    // indices 4 and 5 are { and }
    var bracketCount = [0, 0, 0, 0, 0, 0]
    
    for x in 0..<sTrimmed.count {
        
        // iterates through each character in the String
        let ind = String(sTrimmed[sTrimmed.index(sTrimmed.startIndex, offsetBy: x)])
        
        // increments a bracket count by one whenever
        // the loop encounters a bracket
        switch(ind) {
            case bracketSet[0]: bracketCount[0] += 1
            case bracketSet[1]: bracketCount[1] += 1
            case bracketSet[2]: bracketCount[2] += 1
            case bracketSet[3]: bracketCount[3] += 1
            case bracketSet[4]: bracketCount[4] += 1
            case bracketSet[5]: bracketCount[5] += 1
            
            // function immediately returns false if any character other
            // than a bracket is encountered
            default:
                return false
        }
        
        // checks if any end bracket count is greater than an opening bracket index
        
        // function immediately returns false if closing bracket is encountered
        // before an opening bracket
        if(bracketCount[1] > bracketCount[0] ||
           bracketCount[3] > bracketCount[2] ||
           bracketCount[5] > bracketCount[4]) {
            return false
        }
    }
    
    // checks if opening brackets does not equal closing brackets
    // function immediately returns false if condition is true
    
    // this means that there are not enough closing brackets for each
    // opening bracket
    if(bracketCount[0] != bracketCount[1] ||
       bracketCount[2] != bracketCount[3] ||
       bracketCount[4] != bracketCount[5]) {
        return false
    }
    
    // otherwise, the String input has valid brackets
    return true
}

// test cases
print(checkValidBrackets(s: s1))
print(checkValidBrackets(s: s2))
print(checkValidBrackets(s: s3))
print(checkValidBrackets(s: s4))
print(checkValidBrackets(s: s5))
print(checkValidBrackets(s: s6))
print(checkValidBrackets(s: s7))
print(checkValidBrackets(s: s8))
