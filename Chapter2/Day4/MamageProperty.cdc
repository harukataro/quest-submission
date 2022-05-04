pub contract ManageProperty {

    pub var holds: {Address: Hold}
    
    pub struct Hold {
        pub let nft: Int
        pub let flow: Int
        pub let account: Address

        // You have to pass in 4 arguments when creating this Struct.
        init(_nft: Int, _flow: Int, _account: Address) {
            self.nft = _nft
            self.flow = _flow
            self.account = _account
        }
    }

    pub fun addHold(nft: Int, flow: Int, account: Address) {
        let newHold = Hold(_nft: nft, _flow: flow, _account: account)
        self.holds[account] = newHold
    }

    init() {
        self.holds = {}
    }

}