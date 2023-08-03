// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.19;
import{PriceConverter} from "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;
    uint256 public minimumusd=5;
    address[] public funders;
    mapping (address funder=>uint256 amtFunded) public addressToAmountFunded;
    function fund() public payable{

        require(msg.value.getConversionRate() >= minimumusd, "fakeer paisa bhej");// 1e18-1eth=1*10**18
        funders.push(msg.sender);
//revert- sare actions ko undone kardeta and jo bhi gas bheji voh wapas kar dega but iss process mein bhi gas spent hogi
        addressToAmountFunded[msg.sender]=addressToAmountFunded[msg.sender]+msg.value;



    }
    
}