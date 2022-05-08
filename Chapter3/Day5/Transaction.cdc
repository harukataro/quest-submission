import SomeContract from 0x01

transaction {

  prepare(acct: AuthAccount) {}

  execute {
    log(SomeContract.testStruct.a)
    log(SomeContract.testStruct.b)
    //log(SomeContract.testStruct.c)
    //log(SomeContract.testStruct.d)
    SomeContract.testStruct.a = "x"
    //SomeContract.testStruct.b = "x"
    //SomeContract.testStruct.c = "x"
    //SomeContract.testStruct.d = "x"
  }
}
