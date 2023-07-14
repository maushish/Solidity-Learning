// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;///deifining the version
//this code is just for learning solidity more like my notes
// so in mapping you need to set 2 functions get and set
//but before setting them you also need to define mapping

contract Mapping {
    //so mapping is like dict in python key->value
    //mapping from address to uint
    mapping (address=> uint) public  myMap;//defining
    function get(address _addr) public view  returns(uint){
        //mapping always return a value
        //agar value set nahi hogi it will return the default value i.e 0
        return myMap[_addr];


    }
    function set(address _addr, uint _i) public {
        //update the value at this address
        //set se set karte hai from one to another parameter or type
        myMap[_addr]=_i;
    }
    function remove(address _addr) public {
        //reset the value to default
        //remove se value default ho jati hai
        delete myMap[_addr];
    }
 //Now there are also nested mappings but for this 
 // hum second to third value ko itself as a mapping set karte hai
 //like in this example we did address(1)->uint(2)->bool(3)
 mapping(address=>mapping (uint=>bool))public nestedMap;//defined the mapping
function get(address _addr1, uint _i)public returns (bool){
    //so here we set the 1 and 2 types and made the output in 3
    //u can also get values from nested mapping before they even initialized 
    //like the default value of bool is false
    return nestedMap[_addr][_i];



};
 function set(addres _addr, uint _i ,bool _boo)public {
     nestedMap[_addr][_i]=_boo;//setting the mapping 

 }
 function remove(address _addr , uint _i)public {
     delete nestedMap[_addr][_i];
 }



}