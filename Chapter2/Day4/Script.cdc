import ManageProperty from 0x01

pub fun main(account: Address): ManageProperty.Hold {
    return ManageProperty.holds[account]!
}
