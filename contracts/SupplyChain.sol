pragma solidity ^0.5.0;

contract SupplyChain {

  // Owner is the person who deploy the smartContract
  address owner;
  // skuCount to track the most recent sku # */
  uint public skuCount;
  uint myprice;
  bytes32 myName;

  struct Item {
    bytes32 name;
    uint sku;
    uint price;
    address seller;
    address buyer;
    uint state;

  }

  /* A public mapping that maps the SKU (a number) to an Item defined in the Struct Item.

  */
  mapping(uint => Item) public items;

  // Possible states of an item at any given time in its supplyChain life cycle
  enum State {ForSale, Sold, Shipped, Received}
  event ForSale(uint sku);

  constructor() public {
    owner = msg.sender;
    skuCount = 0;
  }

  // functions

  function addItem(bytes32 _name, uint _price) public returns(bool result){


    items[skuCount] = Item({name: _name, sku: skuCount, price: _price, seller: msg.sender, buyer: address(0), state: uint(State.ForSale)});
    skuCount = skuCount + 1;

    emit ForSale(skuCount);

    result = true;
    return result;

    //return result;
  }


}
