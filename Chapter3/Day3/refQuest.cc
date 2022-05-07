pub contract Token {
    pub var dictionaryOfTokens: @{String: Token}

    pub resource Token {
        pub let proofMethod: String
        init (_proofMethod: String) {
            self.proofMethod = _proofMethod
        }
    }

    pub fun getReference(key: String): &Token {
        return self.dictionaryOfTokens[key] as &Token
    }

    init() {
        self.dictionaryOfTokens <- {
            "Flow": <- create Token(_proofMethod: "POS")
            "Ethereum": <- create Token(_proofMethod: "POW")
        }
    }
}