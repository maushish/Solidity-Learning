// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract ViewAndPure{
    //difference between view and pure is simple
    //view tab lagate hai jab function state value change na kare yaha pe read karega function
    // Pure tab laagate jab function na read na state value ko changge kare
    //declare a state variable
    uint public x=1;
    //promise to not to modify the state but it can read it
    function addToX(uint y) public view  returns(uint) {
        return x+y;
    }
    function add(uint i, uint j)public pure returns(uint){
        return i+j;
    }







}