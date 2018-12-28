pragma solidity ^0.5.0;

contract SupplyChain {

  // Owner is the person who deploy the smartContract
  address owner;
  // skuCount to track the most recent sku # */
  uint public skuCount;

  struct Item {
    bytes24 name;
    uint sku;
    uint price;
    uint state;
    address seller;
    address buyer;


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

  function addItem(bytes24 _name, uint _price) public returns(bool result){
    emit ForSale(skuCount);

    items[skuCount] = Item({name: _name, sku: skuCount, price: _price, state: uint(State.ForSale), seller: msg.sender, buyer: address(0)});
    skuCount = skuCount + 1;

    result = true;
    return result;

  }

  function fetchItem(uint _skuNo) view public returns(bytes24 _name, uint _sku, uint _price, address _seller, address _buyer, uint _state){
    //Item storage myItes = allItems[_skuNo];

    //require(_skuNo > 0);

    _name = items[_skuNo].name;
    _sku = items[_skuNo].sku;
    _price = items[_skuNo].price;
    _seller = items[_skuNo].seller;
    _buyer = items[_skuNo].buyer;
    _state = uint(items[_skuNo].state);

    return (_name, _sku, _price, _seller, _buyer, _state);
  }


}
