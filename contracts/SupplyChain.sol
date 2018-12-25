pragma solidity ^0.5.0;

contract SupplyChain {

  // Owner is the person who deploy the smartContract
  address owner;
  // skuCount to track the most recent sku # */
  uint skuCount;

  struct Item {
    string name;
    uint sku;
    uint price;
    address seller;
    address buyer;
    State state;

  }

  /* A public mapping that maps the SKU (a number) to an Item defined in the Struct Item.

  */
  mapping(uint => Item) public items;
  // Possible states of an item at any given time in its supplyChain life cycle
  enum State {ForSale, Sold, Shipped, Received}


  constructor() public {
    owner = msg.sender;
  }


}
