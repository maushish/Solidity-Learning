// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


library PriceConverter{
    function getPrice()  internal view returns (uint256) {
        //to get the live price of usd in eth we need abi and address that we could take from chainlink price feeds
        //address :0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed= AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (int256 price)=priceFeed.latestRoundData();
        //Price of eth in usd
        //It will be in 8 decimal 
        return uint256(price*1e10);//   To match the differnt decimal places of msg.value i.e 18 unlike this interface you canc check the decimal function to check the decimal places

    }
    function getConversionRate(uint256 ethAmount) internal view returns (uint256){
        uint256 ethPrice=getPrice();
        uint256 ethAmointInUsd=(ethPrice * ethAmount) /1e18;//always multiply first in solidity warna 1/2 will give u 0
        return ethAmointInUsd;
        

    }
    function getVersion() internal  view returns(uint256) {
        return AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e).version();
    }

}
