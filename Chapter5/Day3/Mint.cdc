import CryptoPoops from 0x01
import NonFungibleToken from 0x02

transaction(recipient: Address, name: String, favouriteFood: String, luckyNumber: Int) {

prepare(signer: AuthAccount) {
    let minter = signer.borrow<&CryptoPoops.Minter>(from: /storage/Minter)
      ?? panic("This signer is not the one who deployed the contract.")

    let recipientsCollection = getAccount(recipient).getCapability(/public/MyCollection)
    .borrow<&CryptoPoops.Collection>()
    ?? panic("The recipient does not have a Collection.")

    let nft <- minter.createNFT(name: name, favouriteFood: favouriteFood, luckyNumber: luckyNumber)
    recipientsCollection.deposit(token: <- nft)
  }
}