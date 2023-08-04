// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.19;
import{PriceConverter} from "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;
    uint256 public minimumusd=5;
    address[] public funders;
    
    mapping (address funder=>uint256 amtFunded) public addressToAmountFunded;
    adddress public owner;
    constructor(){
        owner=msg.sender;
    }
    
    function fund() public payable{

        require(msg.value.getConversionRate() >= minimumusd, "fakeer paisa bhej");// 1e18-1eth=1*10**18
        funders.push(msg.sender);
//revert- sare actions ko undone kardeta and jo bhi gas bheji voh wapas kar dega but iss process mein bhi gas spent hogi
        addressToAmountFunded[msg.sender]+=msg.value;



    }
    function withdraw() public onlyOwner{
        require(msg.sender==owner,"Must be owner");
        //for loop
        //[1,2,3,4] elements
        // 0, 1,2,3, indexes
        //for(/* starting index, ending index,step amount*/)
        for(uint256 funderIndex=0; funderIndex<funders.length; funderIndex++){
            address funder =funders[funderIndex];
            addressToAmountFunded[funder]=0;
        }
        //RESET THE ARRAY
        funders = new address[](0);
        //withdraw the funds
        //transfer
        //msg.sender=address
        //payable msg.sender=payable addresss(req. for payments)
        // payable(msg.sender).transfer(adddress(this).balance);
        //send
        // bool sendSuccess=        payable(msg.sender).transfer(adddress(this).balance);
        //require(sendSuccess,"TXN failed");

        //call(best method to transfer eth
        (bool callSuccess,)=payable(msg.sender).call{value:address(this).balance}("");
        require(callSuccess,"Call failed")

    
        

    }
    modifier onlyOwner(){
        requires(msg.sender==owner,"Sender is not owner")
        _;//this means pehel modifier execute hoga then function agar ye upar hua then function pehle hoga tehn modifier
    }
    
}