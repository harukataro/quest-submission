import ManageProperty from 0x01

transaction(nft: Int, flow: Int, account: Address) {

    prepare(signer: AuthAccount) {}

    execute {
        ManageProperty.addHold(nft: nft, flow: flow, account: account)
        log("We're done.")
    }
}