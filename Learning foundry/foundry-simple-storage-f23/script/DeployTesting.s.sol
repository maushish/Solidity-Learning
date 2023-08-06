// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;
import "../lib/forge-std/src/Script.sol";
import "../src/Testing.sol";
contract SimpleStorage is Script{
    function run() external returns (SimpleStorage){
        vm.startBroadcast();
        SimpleStorage simpleStorage=new SimpleStorage(); 
        vm.stopBroadcast();
        return simpleStorage;
    }

  
}