const hre = require("hardhat");

async function main() {
  const token = await hre.ethers.deployContract("Token", [100000]);

  await token.waitForDeployment();

  console.log(`Deployed contract Address ${token.target}`);

  const getToken = await hre.ethers.getContractAt("Token", token.target);
  const getTotalSupply = await getToken.totalSupply();
  console.log("Total supply: ", getTotalSupply.toString());

  console.log(`Token deployed to ${token.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
