
import HelloWorld from 0x01

transaction(myNewGreeting: String, newNumber: Int) {
    prepare(signer: AuthAccount) {}

    execute {
        HelloWorld.changeGreeting(newGreeting: myNewGreeting)
        HelloWorld.updateMyNumber(newNumber: newNumber)
    }
}

import HelloWorld from 0x01

pub fun main(): Int{
    return HelloWorld.myNumber
}