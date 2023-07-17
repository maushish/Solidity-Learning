// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract Modifiers{
    address public owner;
    constructor(){
        //set the contract deployer as the owner of the contract
        owner=msg.sender;
    }
    //create a modifier that only allows the owner to call a function
    modifier onlyOwner(){
        require(msg.sender==owner,"You are nto the owner");
        _;
        //underscore lagan imp hai in modifiers
        //why? ye underscore hi batata hai solidity ko ki execute modifier on this function


    }
    //create a function and apply the onlyOwner modifier on it
    function changeOwner(address _newOwner)public onlyOwner{
        owner=_newOwner;
        //we will only reach this step if modifier ke sare conditions satisfy hongi
    }




}