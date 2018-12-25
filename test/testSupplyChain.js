var SupplyChain = artifacts.require('SupplyChain')

contract('test for the supply chain smart contract', function(accounts){
let deployedContract;

beforeEach('', async () => {
  deployedContract = await SupplyChain.deployed();
});


it('print address', async () => {
console.log(deployedContract.address);  
});
});
