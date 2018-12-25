//pragma solidity ^0.5.0;
pragma solidity >= 0.4.15 < 0.6.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

contract TestSupplyChain {

    // Test for failing conditions in this contracts
    SupplyChain supplyChain = SupplyChain(DeployedAddresses.SupplyChain());
    //address addr = supplyChain.constructor();
    // test that every modifier is working

    function testAddress() public {
      AssertAddress.isNotZero(0xB97a97C925d093d6382C70013fc02902cc046BAE,"equallll");
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
