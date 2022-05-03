#Day3

1. In a script, initialize an array (that has length == 3) of your favourite people, represented as Strings, and log it.

let fPeople: [String] = ["Taro", "Jiro", "Saburo"]
log(fPeople[0])

2, In a script, initialize a dictionary that maps the Strings Facebook, Instagram, Twitter, YouTube, Reddit, and LinkedIn to a UInt64 that represents the order in which you use them from most to least. For example, YouTube --> 1, Reddit --> 2, etc. If you've never used one before, map it to 0!

let snsUse: {String: UInt64} = {"Facebook": 6, "Instagram": 3, "Twitter": 1, "YouTube": 2, "Reddit": 5, "LinkedIn": 4}

3, Explain what the force unwrap operator ! does, with an example different from the one I showed you (you can just change the type).

operator ! use to unwrap optional value. optional value is not same with original type such as String. so if program does not expect Optional type. it will make error.
This is modern programing language functions. old programing language did not have this operator, accept null as value.

var name1: String? = "Taro"
var name2: String? = nil
var name3: String = nil

4, Using this picture below, explain...
What the error message means
    this is error that not much Type.

Why we're getting this error
    function return expect String but program return String? that is Optional type. so Cadence tell us miss much.

How to fix it
    Unwrap Optional type.

    ```
    return thing[0x03]!  
    ```
