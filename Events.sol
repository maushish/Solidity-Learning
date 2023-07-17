// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract Events{
    //these are used to interact with frontend let's say  you want a button when its clicked to initalize a function in smart contract
    //forex:Declare an event which logs on address and string
    event TestCalled(address sender, string message);
    function test()public {
        //log an event
        emit TestCalled(msg.sender,"someone called test()");
    }









}