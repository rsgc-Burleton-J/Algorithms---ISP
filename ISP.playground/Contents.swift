//: Playground - noun: a place where people can play

import Cocoa

let fileURL = NSBundle.mainBundle().URLForResource("bush-speech", withExtension: "txt")

// Get the contents of the file, and place in a String.
// Note that this loads entire file into memory.
// Not efficient for very large files.
let content = try String(contentsOfURL: fileURL!, encoding:
    NSUTF8StringEncoding)

// Set the delimiters we will use to break up the string
let delimiters = NSCharacterSet(charactersInString: ", \n")

// Break the string up into an array using delimiters created above
let words = content.componentsSeparatedByCharactersInSet(delimiters)

// Review the contents of the array (click the + button in the sidebar to show the result)
words

var wordCounts = [String: Int]()

// loop over the input string
for word in content.componentsSeparatedByCharactersInSet(delimiters) {
    
    // inspect each word
    word
    // build the dictionary (list) of word counts
    if wordCounts[word] == nil {
        wordCounts[word] = 1        // first time for this word!
    } else {
        //This word is in the dictionary so just add 1 to the current count
    
        wordCounts[word]! = wordCounts[word]! + 1
    }
}

// This is the dictionary we have built – it actually shows letter COUNTS, not probabilities – YET.
wordCounts




