pub contract Zoo {

    pub resource interface IAnimal {
      pub var name: String
      pub var weight: Int
      pub fun updateWeight(newWeight: Int): Int
    }

    pub resource Animal: IAnimal {
      pub var name: String
      pub var weight: Int

      pub fun updateWeight(newWeight: Int): Int {
        self.weight = newWeight
        return self.weight
      }

      init() {
        self.name = "Elephant"
        self.weight = 3000
      }
    }

    pub fun noInterface() {
      let elephant: @Animal <- create Animal()
      let newWeight = elephant.updateWeight(newWeight: 4000)
      log(newWeight)

      destroy elephant
    }

    pub fun yesInterface() {
      let elephant: @Animal{IAnimal} <- create Animal()
      let newWeight = elephant.updateWeight(newWeight: 5000)
      log(newWeight)

      destroy elephant
    }
}