// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
//eth transfers there are generally three methods lekin apun sirf ek padenge safe hai jo
//Best method to transfer eth is to use the ```call``` function it will return a bool value
contract SendEther{
    function sendEth(address payable _to) public payable{
        //yaha pe apun address payable yaha pe wallet se SMC pe eth jayega ```_to``` designation hai SMC ki
        uint amountToSend=msg.value;
        //call returns a bool value specifying success or failure
        (bool success, bytes memory data)=_to.call{value:msg.value}("hey");
        //ye lhs mein ek tuple hai jismei first is bool to check the condn of transaction whethere it was successful or not
        //dusra elementof tuple hai data jo sender bhejna chahta ho in this case it is hey
        require(success==true,"TRANSACTION FAILED!");

    }
}






