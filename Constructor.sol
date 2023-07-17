// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract X{//constructor smc ke shuruwat mein execute karte hain 
//it can not be manually called ever again after contract has deployed
//therefore sirf ek baar execute hoga
string public name;
//create an example variable
constructor(string memory _name){
    //this will be set immediatedly when contract is deployed
    name=_name;
}




}