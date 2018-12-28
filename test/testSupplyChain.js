var SupplyChain = artifacts.require('SupplyChain')

contract('test for the supply chain smart contract', function(accounts){

const owner = accounts[0]
const alice = accounts[1]
const bob = accounts[2]
const emptyAddress = '0x0000000000000000000000000000000000000000'

let deployedContract;
var name = 'book'
const price = '1000'
var sku
var eventEmitted = false
var result
var returnName

beforeEach('', async () => {
  deployedContract = await SupplyChain.deployed();
});


it('should add an item with the provided name and price', async () => {


  var nameBytes = web3.utils.fromAscii(name);
  const tx = await deployedContract.addItem(nameBytes , price, {from: alice});

  if(tx.logs[0].event === 'ForSale'){

    sku = tx.logs[0].args.sku.toString(10)
    eventEmitted = true;

  }

  try{
    result = await deployedContract.items.call(sku);
    returnName = result[0].replace(/^\s+|0+$/g, ' ')
    }
    catch(err){
      console.log(err.message)
    }

  assert.equal(returnName.trim() , nameBytes ,'the name of the last added item does not match the expected value')
  assert.equal(result[1].toString(10), sku,'sku ')
  assert.equal(result[2].toString(10), price,'the price of the last added item does not match the expected value')
  assert.equal(result[3], 0, 'the state of the item should be "For Sale", which should be declared first in the State Enum')
  assert.equal(result[4], alice, 'the address adding the item should be listed as the seller')
  assert.equal(result[5], emptyAddress,'the buyer address should be set to 0 when an item is added')
  assert.equal(eventEmitted, true,'adding an item should emit a For Sale event')


  });

});
