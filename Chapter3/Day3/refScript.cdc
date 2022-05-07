import TokenProofContract from 0x01

pub fun main(): String {
  let ref = TokenProofContract.getReference(key: "Flow")
  return ref.proofMethod
}