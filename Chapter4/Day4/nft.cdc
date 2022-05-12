pub contract CryptoPoops {
  pub var totalSupply: UInt64

  // This is an NFT resource that contains a name,
  // favouriteFood, and luckyNumber
  pub resource NFT {
    pub let id: UInt64

    pub let name: String
    pub let favouriteFood: String
    pub let luckyNumber: Int

    // initialize the NFT resource with given metadata
    init(_name: String, _favouriteFood: String, _luckyNumber: Int) {
      self.id = self.uuid

      self.name = _name
      self.favouriteFood = _favouriteFood
      self.luckyNumber = _luckyNumber
    }
  }

  // This is a resource interface that allows us to... you get the point.
  pub resource interface CollectionPublic {
    pub fun deposit(token: @NFT)
    pub fun getIDs(): [UInt64]
    pub fun borrowNFT(id: UInt64): &NFT
  }

  // This is Collection implementation with Collection Public interface
  pub resource Collection: CollectionPublic {
    // This is actual NFT stored　associative array
    pub var ownedNFTs: @{UInt64: NFT}

    // deposit function recieve NFT object from transaction and sore it in contract 
    pub fun deposit(token: @NFT) {
      self.ownedNFTs[token.id] <-! token
    }

    // withdraw function return NFT object from contract
    pub fun withdraw(withdrawID: UInt64): @NFT {
      let nft <- self.ownedNFTs.remove(key: withdrawID) 
              ?? panic("This NFT does not exist in this Collection.")
      return <- nft
    }

    // provide existing NFT IDs
    pub fun getIDs(): [UInt64] {
      return self.ownedNFTs.keys
    }

    // borrow NFT from contract to see inside
    pub fun borrowNFT(id: UInt64): &NFT {
      return &self.ownedNFTs[id] as &NFT
    }

    // initialize the NFT correction array empty.
    init() {
      self.ownedNFTs <- {}
    }

    // destory NFT Collection
    destroy() {
      destroy self.ownedNFTs
    }
  }

  // Create Empty Collection
  pub fun createEmptyCollection(): @Collection {
    return <- create Collection()
  }

  // Minter function resource contain mint function call inside.
  pub resource Minter {

    // mint function call
    pub fun createNFT(name: String, favouriteFood: String, luckyNumber: Int): @NFT {
      return <- create NFT(_name: name, _favouriteFood: favouriteFood, _luckyNumber: luckyNumber)
    }

    pub fun createMinter(): @Minter {
      return <- create Minter()
    }

  }

  // Contract initializa. 
  init() {
    //set total sapply to 0
    //create Minter resource and save it in deployer account
    self.totalSupply = 0
    self.account.save(<- create Minter(), to: /storage/Minter)
  }
}