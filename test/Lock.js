const { expect } = require("chai");
const hre = require("hardhat");

// describe("deploy", function () {
//   it("Should deploy the contract", async function () {
//     const Contract = await hre.ethers.getContractFactory("token");
//     const instance = await Contract.deploy(1);
//     await instance.waitForDeployment();
//     const accounts = await ethers.getSigners()
//     const deployer = accounts[0];
//     const balance = await instance.balanceOf(deployer.address);
//     console.log(ethers.formatEther(balance));
//     // console.log(balance); 
//   });
// });

describe("OceanToken contract", function () {
  // global vars
  let Token;
  let oceanToken;
  let owner;
  let addr1;
  let addr2;
  let tokenCap = 100000000;
  let tokenBlockReward = 50;

  beforeEach(async function () {
    // Get the ContractFactory and Signers here.
    Token = await ethers.getContractFactory("token");
    [owner, addr1, addr2] = await hre.ethers.getSigners();

    oceanToken = await Token.deploy(tokenCap, tokenBlockReward);
  });

  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      expect(await oceanToken.owner()).to.equal(owner.address);
    });

    it("Should assign the total supply of tokens to the owner", async function () {
      const ownerBalance = await oceanToken.balanceOf(owner.address);
      expect(await oceanToken.totalSupply()).to.equal(ownerBalance);
    });

    it("Should set the max capped supply to the argument provided during deployment", async function () {
      const cap = await oceanToken.cap();
      expect(Number(hre.ethers.utils.formatEther(cap))).to.equal(tokenCap);
    });

    it("Should set the blockReward to the argument provided during deployment", async function () {
      const blockReward = await oceanToken.blockReward();
      expect(Number(hre.ethers.utils.formatEther(blockReward))).to.equal(tokenBlockReward);
    });
  });


})