access(all) contract SomeContract {
    pub var testStruct: SomeStruct

    pub struct SomeStruct {

        //
        // 4 Variables
        //

        pub(set) var a: String

        pub var b: String

        access(contract) var c: String

        access(self) var d: String

        //
        // 3 Functions
        //

        pub fun publicFunc() {}

        access(contract) fun contractFunc() {}

        access(self) fun privateFunc() {}


        pub fun structFunc() {
            /*** AREA 2 ***/
            log(self.a)
            log(self.b)
            log(self.c)
            log(self.d)
        }

        init() {
            self.a = "a"
            self.b = "b"
            self.c = "c"
            self.d = "d"
        }
    }

    pub resource SomeResource {
        pub var e: Int

        pub fun resourceFunc() {
            /*** AREA 2 ***/
            //log(self.testStruct.a)
            //log(self.testStruct.b)
            //log(self.testStruct.c)
            //log(self.testStruct.d)
            //self.testStruct.a = "x"
            //self.testStruct.b = "x"
            //self.testStruct.c = "x"
            //self.testStruct.d = "x"
        }

        init() {
            self.e = 17
        }
    }

    pub fun createSomeResource(): @SomeResource {
        return <- create SomeResource()
    }

    pub fun questsAreFun() {
        /**************/
        /*** AREA 3 ****/
        /**************/
            log(self.testStruct.a)
            log(self.testStruct.b)
            log(self.testStruct.c)
            //log(self.testStruct.d)
            self.testStruct.a = "x"
            //self.testStruct.b = "x"
            //self.testStruct.c = "x"
            //self.testStruct.d = "x"

    }

    init() {
        self.testStruct = SomeStruct()
    }
}