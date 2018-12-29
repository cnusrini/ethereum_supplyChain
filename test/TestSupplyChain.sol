pragma solidity ^0.5.0;
//pragma solidity >= 0.4.15 < 0.6.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

contract TestSupplyChain {
    SupplyChain public supplyChain;
    address public seller;
    address public buyer;
    // Test for failing conditions in this contracts
    //SupplyChain supplyChain = SupplyChain(DeployedAddresses.SupplyChain());
    //address addr = supplyChain.constructor();
    // test that every modifier is working
    event sellerBuyer(string sellbuy , address seller, address buyer);
    event ForSale(string sample , bytes24 name, uint sku, uint price);
    /*
    function testAddress() public {

      AssertAddress.isNotZero(0xB97a97C925d093d6382C70013fc02902cc046BAE,"equallll");
    }
    */
    //addItem
    function testAddItem() public {
      //SupplyChain supplyChain = SupplyChain(DeployedAddresses.SupplyChain());
      supplyChain = new SupplyChain();
      seller = msg.sender;
      emit sellerBuyer('seller and buyer', seller, buyer);
      bytes24 expectedName = "book";

      uint expectedPrice = 1000;


      uint sku = supplyChain.addItem(expectedName, expectedPrice);
      emit ForSale('expected', expectedName,sku,expectedPrice);
      //bytes24 _name, uint _sku, uint _price, address _seller, address _buyer, uint _state
      //(actualName,actualSku,actualPrice,actualSeller,actualBuyer,actualState) = supplyChain.fetchItem(sku);
      bytes24 actualName ;
      uint actualPrice ;
      address actualSeller ;
      address actualBuyer ;
      uint actualState ;
      uint actualSku;

      (actualName,actualSku) = supplyChain.fetchItem(sku);
      //supplyChain.fetchItem(sku);

      emit ForSale('actual', actualName, actualSku,actualPrice);
      /*
      log0(
        msg.data()
        );
        */

      Assert.equal(actualPrice, expectedPrice, 'not equal');

    }
    // buyItem

    // test for failure if user does not send enough funds
    // test for purchasing an item that is not for Sale


    // shipItem

    // test for calls that are made by not the seller
    // test for trying to ship an item that is not marked Sold

    // receiveItem

    // test calling the function from an address that is not the buyer
    // test calling the function on an item not marked Shipped




}
