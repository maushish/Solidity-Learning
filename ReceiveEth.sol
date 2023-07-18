// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
//Recieving eth 
//Now in case of EOAs like metamask you don't need do anything but let's say you want a SMC to directly accept ETH transfers.
//for this you need to have one of these function:
// recieve() external payable(this is called if msg.data is empty otherwise fallback usekaro)
// fallback() external payable
contract RecieveEther{
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

    //function to recieve eth , ismein msg.data empty hona chahiye
    receive() external payable {}
    //fallback agar msg.data khali nahi hua
    fallback() external payable{}
    function getBalance() public view returns (uint){
        return address(this).balance;
   }

}
