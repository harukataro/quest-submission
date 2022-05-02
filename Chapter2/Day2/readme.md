1, Explain why we wouldn't call changeGreeting in a script.

Transaction requre gus cost. so script is good for read state vaue.

2, What does the AuthAccount mean in the prepare phase of the transaction?

to make enable to access my accouts.

3, What is the difference between the prepare phase and the execute phase in the transaction?

it is essentially same but it is set for read and maintenance easy.

4, This is the hardest quest so far, so if it takes you some time, do not worry! I can help you in the Discord if you have questions.
Add two new things inside your contract:
A variable named myNumber that has type Int (set it to 0 when the contract is deployed)
A function named updateMyNumber that takes in a new number named newNumber as a parameter that has type Int and updates myNumber to be newNumber
Add a script that reads myNumber from the contract
Add a transaction that takes in a parameter named myNewNumber and passes it into the updateMyNumber function. Verify that your number changed by running the script again.


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
