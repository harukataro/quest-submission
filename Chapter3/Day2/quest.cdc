pub contract Tokens {

    pub var dictionaryOfTokens: @{Int: Token}

    pub resource  Token {
        pub let name: String
        init() {
            self.name = ""
        }
    }

    pub fun addToken(idx:Int, token: @Token) {

        self.dictionaryOfTokens[idx] <-! token
    }

    pub fun removeGreeting(key: Int): @Token {
        let tokens <- self.dictionaryOfTokens.remove(key:key) ?? panic("oh no")
        return <-tokens
    }

    init(){
        self.dictionaryOfTokens <- {}
    }
}







