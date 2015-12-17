// Import required APIs
import Cocoa

// Set location of file
// Files obtained from:
// http://www.presidentialrhetoric.com/campaign/speeches/bush_oct19.html
// http://www.presidentialrhetoric.com/campaign/speeches/bush_oct22.html
// Only edits:
// - Removed text "AUDIENCE: ..."
// - Removed text "(Applause.)"
// - Removed text "(Laugther.)"
// – Removed text "THE PRESIDENT:"

// Set the location of the file
let fileURL = NSBundle.mainBundle().URLForResource("bush-speech", withExtension: "txt")

// Get the contents of the file, and place in a String.
// Note that this loads entire file into memory.
// Not efficient for very large files.
var content: String = ""
content = try String(contentsOfURL: fileURL!, encoding: NSUTF8StringEncoding)
// Check contents of file
//content = "The quick brown fox jumped over the lazy dog. The slow cat curled up beside the fire. I try to avoid fire."
//content = "the beautiful sun creates the lovely warmth. the beautiful trees grow."

// Set the delimiters we will use to break up the string
let delimiters = NSCharacterSet(charactersInString: ", \n")

// Break the string up into an array using delimiters created above
let words = content.componentsSeparatedByCharactersInSet(delimiters)

// Review the contents of the array (click the + button in the sidebar to show the result)
words


/*
Algorithm
=========
* create suffix dictionary
* create prefix dictionary
* loop over the array of input words, starting at the first element, stopping at second last element
* when a word is considered:
* add it to the prefix dictionary if it is not already there
* immediately add a suffix to track total suffix words considered, set that suffix count to 0
* add the word that follows the prefix in the input array to the suffix dictionary...
* ... with a count of 1 if that is the first occurence of that suffix following the prefix
* or add 1 to the existing entry for that suffix
* finally, always add 1 to the suffix used to track total suffix count following the current prefix

Example input:

the beautiful sun creates the lovely warmth.

Would produce suffix/prefix dictionaries that grow with each iteration over the input string like this:

Iteration 1:
------------
the         -> beautiful    -> 1
-> ~            -> 1

Iteration 2:
------------
the         -> beautiful    -> 1
-> ~            -> 1
beautiful   -> sun          -> 1
-> ~            -> 1

Iteration 3:
------------
the         -> beautiful    -> 1
-> ~            -> 1
beautiful   -> sun          -> 1
-> ~            -> 1
sun         -> creates      -> 1
-> ~            -> 1

Iteration 4:
------------
the         -> beautiful    -> 1
-> ~            -> 1
beautiful   -> sun          -> 1
-> ~            -> 1
sun         -> creates      -> 1
-> ~            -> 1
creates     -> the          -> 1
-> ~            -> 1

Iteration 4:
------------
the         -> beautiful    -> 1
-> lovely       -> 1
-> ~            -> 2
beautiful   -> sun          -> 1
-> ~            -> 1
sun         -> creates      -> 1
-> ~            -> 1
creates     -> the          -> 1
-> ~            -> 1

Iteration 5:
------------
the         -> beautiful    -> 1
-> lovely       -> 1
-> ~            -> 2
beautiful   -> sun          -> 1
-> ~            -> 1
sun         -> creates      -> 1
-> ~            -> 1
creates     -> the          -> 1
-> ~            -> 1
lovely      -> warmth.      -> 1
-> ~            -> 1

*/

// Build the dictionary of prefix and suffix counts
// The prefix diciontary has a key of type String.
// A prefix points to a second dictionary that stores all the suffixes that followed it in the source text.
// Within a given suffix dictionary, each suffix is a key of type String, pointing to a count, which is type Integer.
// One key in each suffix dictionary tracks the total count of how many words in total followed the prefix in the souce text. This key will be a special character (say, a tilde, or a rarely used emoji – should be something that would not appear as a prefix in the source text).
// See above image for example.

// Make dictionaries to track prefix and suffix counts
// NOTE: Must build dictionaries from right to left (end of tree first, then work backwards)
var suffix = [String: Int] ()
var prefix = [String : [String : Int]] ()

// Loop over input words
for (index, word) in words.enumerate() {
    
    // Stop loop before final element is considered (there can be no suffix for final word in input)
    if index == words.count - 1 {
        break
    }
    
    // when the current word from the input array is not in the prefix dictionary at all
    // ALSO: skip blank entries in the input array, if any exist
    if prefix[word] == nil && word != " " {
        
        suffix[words[index + 1]] = 1    // add a count of 1 for the prefix (word following current word in input)
        suffix["📐"] = 1                // triangular ruler key represents total suffix count
        prefix[word] = suffix           // current word from input array becomes key in prefix dictionary and
        // the value is the suffix dictionary just created
    } else {
        // the current prefix exists
        // so:
        //      * add 1 to total in suffix dictionary
        //          * if suffix for this prefix does not exist, create it and set to 1
        //          * if suffix for this prefix does exists, just add 1 to existing count
        
        // add 1 to total in suffix dictionary
        prefix[word]!["📐"]! += 1
        
        // does current word exist as a suffix already?
        if prefix[word]![words[index + 1]] == nil {         // does not exist, so create and set to 1
            prefix[word]![words[index + 1]] = 1
            
        } else {                                            // does exist, so increment by 1
            prefix[word]![words[index + 1]]! += 1
        }
    }
    
    // wipe out the suffix dictionary for next iteration, so it starts blank
    suffix = [:]
}

prefix

suffix

/*
Example of how to access deeply nested dictionaries in Swift:

var colorsDict = [String : Int]()
var patternsDict =  [String : [String : Int]] ()
var bugsDict = [String : [String : [String : Int]]] ()

colorsDict["red"] = 1
patternsDict["spotted"] = colorsDict
bugsDict["ladybug"] = patternsDict


bugsDict["ladybug"]!["spotted"]!["red"]!++ // Prints 1
bugsDict["ladybug"]!["spotted"]!["red"]!++ // Prints 2
bugsDict["ladybug"]!["spotted"]!["red"]!++ // Prints 3
bugsDict["ladybug"]!["spotted"]!["red"]! // Prints 4

from: http://stackoverflow.com/questions/25475463/how-to-access-deeply-nested-dictionaries-in-swift
*/


// FINALLY:
// Use the dictionary to build an output string based on a Markov chain.
// Build output string where output ends on a word with a period
var currentWord = "the"             // output sentence will start with this word
var output: String = currentWord + " "    // start the output sentence
var endSentence: Bool = false

// Loop indefinitely (until a word with a period is found)
while(true) {
    //for _ in 1...5 {
    
    // make sure the current word being considered is in the dictionary
    // (the only time it wouldn't be is if the initial current word (chosen above) was not in prefix dictionary
    if prefix[currentWord] != nil && currentWord != " " {
        
        // Generate the random value
        let randomValue = Float(arc4random_uniform(1000000)) / 10000
        randomValue
        
        // Stores upper value of probability for current suffix word
        var upperValue: Float = 0
        
        // iterate over all suffix words for this prefix
        for (potentialSuffix, count) in prefix[currentWord]! {
            
            // get total suffix words for this prefix
            let totalSuffixWords = prefix[currentWord]!["📐"]!
            //print("\(totalSuffixWords)\n")
            
            // number of times current prefix occured
            count
            
            // Don't consider total value for addition to the output string
            if potentialSuffix != "📐" {
                
                // determine upper value for this prefix
                upperValue += Float(count) / Float( totalSuffixWords ) * 100
                
                // decide whether this suffix should be used
                if (randomValue < upperValue) {
                    
                    // add the potential (now chosen) suffix to the output string
                    output += potentialSuffix
                    
                    // make the potential (now chosen) suffix the new prefix
                    currentWord = potentialSuffix
                    
                    // See if we should stop building the sentence (does current string end with a period?)
                    if output[output.endIndex.predecessor()] == "." {
                        endSentence = true // boolean to tell us when to break the outer loop
                    }
                    
                    // Add a space before the next word
                    output += " "
                    
                    // break the loop going over the word probabilities (since we have found a word to add)
                    break
                }
            }
        }
        
    } else {
        // Cannot begin building sentence, first selection for current word was not found
        output = "Initial word provided to start the Markov chain: '\(currentWord)' was not found in the prefix dictionary. Sorry."
        
        // Stop building the output sentence.
        break
    }
    
    // Stop building the sentence if last word added has a period
    if (endSentence == true) {
        break
    }
    
}

output

