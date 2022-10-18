import { ethers } from "hardhat"
import { expect } from "chai"
import { SimpleStorage } from "../typechain-types"

describe("SimpleStorage", function () {
  let contract: SimpleStorage
  beforeEach("Contract should be deployed before every IF", async () => {
    const simpleStorageFactory = await ethers.getContractFactory("SimpleStorage")
    contract = await simpleStorageFactory.deploy()
    await contract.deployed()
  })
  it("should store favorite Number", async () => {
    await contract.storePersonalInfo("Ali", 24)
    expect(await contract.getNumberByName("Ali")).to.be.equal(24)
  })
  it("can retrive member at index", async () => {
    await contract.storePersonalInfo("Mehmet", 38)
    const x = await contract.getMemberAtIndex(0)
    expect(x[0]).to.be.equal("Mehmet", "Name is wrong!")
    expect(x[1]).to.be.equal(38, "wrong favorite Number!")
  })
  it("Should have a defined owner", async () => {
    expect(await contract.getOwner()).to.be.equal(await contract.signer.getAddress(), "Owner is not equal to signer")
  })
  it("can retrieve name from address", async () => {
    await contract.storePersonalInfo("Umut", 29)

    expect(await contract.getNameByAddress(contract.signer.getAddress())).to.be.equal("Umut")
  })
})
