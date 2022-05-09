const hre = require("hardhat");

async function main() {
  
  const Task = await hre.ethers.getContractFactory("TaskContract");
  const task = await Task.deploy();

  await task.deployed();

  console.log("Task deployed to:", task.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });