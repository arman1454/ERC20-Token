const { expect } = require("chai");
const hre = require("hardhat");

describe("deploy", function () {
  it("Should deploy the contract", async function () {
    const Contract = await hre.ethers.getContractFactory("token");
    const instance = await Contract.deploy(1);
    await instance.waitForDeployment();
    const accounts = await ethers.getSigners()
    const deployer = accounts[0];
    const balance = await instance.balanceOf(deployer.address);
    // console.log(ethers.formatEther(balance));
    console.log(balance); 
  });
});