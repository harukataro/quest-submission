# Day1

## Describe what an event is, and why it might be useful to a client

- broadcast what done in smart contract to chain. you can check status with script but  is is not efficient.

## Deploy a contract with an event in it, and emit the event somewhere else in the contract indicating that it happened

``` flow
pub contract EventTest {

  pub event AddEvent(newNum: Int)
  pub var num: Int

    init() {
      self.num = 0
    }

  pub fun addNum(val: Int): Int {

    self.num = self.num + val
    emit AddEvent(newNum: self.num)
    
    return self.num
  }

}
```

```flow
import EventTest from 0x01

transaction {

  prepare(acct: AuthAccount) {}

  execute {
    var result = EventTest.addNum(val: 8)
    log(result)
  }
}
```

## Using the contract in step 2), add some pre conditions and post conditions to your contract to get used to writing them out.

```flow
pub contract EventTest {

  pub event AddEvent(newNum: Int)
  pub var num: Int

    init() {
      self.num = 0
    }

  pub fun addNum(val: Int): Int {

    pre{val >0: "Negative value"}
    post{self.num <10: "too big"}

    self.num = self.num + val
    emit AddEvent(newNum: self.num)
    
    return self.num
  }
}
```

## For each of the functions below (numberOne, numberTwo, numberThree), follow the instructions

- Tell me whether or not this function will log the name.
  - Yes
- Tell me whether or not this function will return a value.
  - Yes
- Tell me whether or not this function will return a value.
  - No
  - self.number  is 0
