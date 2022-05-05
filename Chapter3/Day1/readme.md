# Chapter3 Day1

1, In words, list 3 reasons why structs are different from resources.

- can create outside of contract
- can overwrite easily
- can copy easily

2, Describe a situation where a resource might be better to use than a struct.

like create NFT. that have value and unique.

3, What is the keyword to make a new resource?

create

4, Can a resource be created in a script or transaction (assuming there isn't a public function to create one)?

no.

5, What is the type of the resource below?

Jacob

6, Let's play the "I Spy" game from when we were kids. I Spy 4 things wrong with this code. Please fix them.

pub contract Test {

    // Hint: There's nothing wrong here ;)
    pub resource Jacob {
        pub let rocks: Bool
        init() {
            self.rocks = true
        }
    }

    pub fun createJacob(): @Jacob {
        let myJacob <- create Jacob() 
        return <- myJacob 
    }
}