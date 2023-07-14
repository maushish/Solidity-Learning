// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract Enums{//enumerable -types jo hum banaye for
//a set of constants called members
//remember these are just abstraction or representation for human readable contents
// in actuality they are just considered as uints 
enum Status{//declaring enum for status after this status is a type
    Pending,
    Shipped,
    Accepted,
    Rejected,
    Cancelled
}
//declare a variable of type status
//But it can containe one of the predefined values
Status public status;
//now enums are internally represented as uints so
//Pending=0
//Shipepd=1.... keeps going on
//so value 4 i.e Cancelled agar koi value 4 se zaada hu then it can't be returned
//after declaring a variable get functn then set functn
function get() public view returns(Status){
    return status;

}
//pass the desired status enum value as a uint
function set(Status _status) public {
    status=_status;

}
//wanna update the number in this case try accepted
function accept() public {
    status=Status.Accepted;
}


