# Day2

## 1. What does .link() do?

Link provide pointer to storage object. and it can be access from public and private.

## 2. In your own words (no code), explain how we can use resource interfaces to only expose certain things to the /public/ path.

in smart contract. define interface for resource that limited we want to allow access. and when make resource link. use interface instead of resource.

## 3. Deploy a contract that contains a resource that implements a resource interface. Then, do the following:

### i.  In a transaction, save the resource to storage and link it to the public with the restrictive interface.

```
pub contract Stuff {

  pub resource interface ICat {
    pub var color: String
    pub fun changeColor(newColor: String)
  }

  pub resource Cat: ICat {
    pub var color: String
    pub var weight: Int

    pub fun changeColor(newColor: String) {
      self.color = newColor
    }

    pub fun changeWeight(newWeight: Int) {
        self.weight = newWeight
    }

    init() {
      self.color = "black"
      self.weight = 10
    }
  }

  pub fun createTest(): @Cat {
    return <- create Cat()
  }

}
```

```
import Stuff from 0x01
transaction() {
  prepare(signer: AuthAccount) {
    signer.save(<- Stuff.createTest(), to: /storage/MyTestResource)
    signer.link<&Stuff.Cat{Stuff.ICat}>(/public/MyTestResource, target: /storage/MyTestResource)
  }

  execute {

  }
}
```



### ii. Run a script that tries to access a non-exposed field in the resource interface, and see the error pop up.

```
import Stuff from 0x01
pub fun main(address: Address): String {
  let publicCapability: Capability<&Stuff.Cat{Stuff.ICat}> =
    getAccount(address).getCapability<&Stuff.Cat{Stuff.ICat}>(/public/MyTestResource)

  let testResource: &Stuff.Cat{Stuff.ICat} = publicCapability.borrow() 
    ?? panic("The capability doesn't exist or you did not specify the right type when you got the capability.")

  // This works because `name` is in `&Stuff.Test{Stuff.ITest}`
  return testResource.weight
}

```

```
Type
&Stuff.Cat{Stuff.ICat}
member of restricted type is not accessible: weight
mismatched types. expected `String`, got `Int`
No quick fixes available
```

### iii. Run the script and access something you CAN read from. Return it from the script.

```
import Stuff from 0x01
pub fun main(address: Address): String {
  let publicCapability: Capability<&Stuff.Cat{Stuff.ICat}> =
    getAccount(address).getCapability<&Stuff.Cat{Stuff.ICat}>(/public/MyTestResource)

  let testResource: &Stuff.Cat{Stuff.ICat} = publicCapability.borrow() 
    ?? panic("The capability doesn't exist or you did not specify the right type when you got the capability.")

  // This works because `name` is in `&Stuff.Test{Stuff.ITest}`
  return testResource.color
}
```