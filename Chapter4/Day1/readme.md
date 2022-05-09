# Day1

1. Explain what lives inside of an account.

  - Contract and Data like NFT


2. What is the difference between the /storage/, /public/, and /private/ paths?

   - storage is private that can be access by owner oly
   - public can be accessed by anyone
   - private can be accessed by owner and account owner give access to.

   3. What does .save() do? What does .load() do? What does .borrow() do?
   - save() is save data into account storage
   - load() is load date from account storage
   - borrow() is just get rederence to data in account storage. not move data.

4. Explain why we couldn't save something to our account storage inside of a script.
   - no authorization given at there.

5. Explain why I couldn't save something to your account.
   - no authorization given at there.

6. Define a contract that returns a resource that has at least 1 field in it. Then, write 2 transactions:

A transaction that first saves the resource to account storage, then loads it out of account storage, logs a field inside the resource, and destroys it.

```
import Stuff from 0x01
transaction() {
  prepare(signer: AuthAccount) {
    let testResource <- Stuff.createTest()
    signer.save(<- testResource, to: /storage/MyTestResource) 
    let testResource2 <- signer.load<@Stuff.Test>(from: /storage/MyTestResource)
                          ?? panic("A `@Stuff.Test` resource does not live here.")
    log(testResource2.name) // "haruxx"
    destroy testResource2
  }

  execute {

  }
}
```

A transaction that first saves the resource to account storage, then borrows a reference to it, and logs a field inside the resource.

```
import Stuff from 0x01
transaction() {
  prepare(signer: AuthAccount) {
    let testResource <- Stuff.createTest()
    signer.save(<- testResource, to: /storage/MyTestResource) 
    let testResource2 = signer.borrow<&Stuff.Test>(from: /storage/MyTestResource)
                          ?? panic("A `@Stuff.Test` resource does not live here.")
    log(testResource2.name) // "haruxx"
  }

  execute {

  }
}
```
