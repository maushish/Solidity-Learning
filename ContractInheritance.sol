// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
//so in solidity to inherit other contract ```is``` keyword is used
// a parent contract jismein koi aisa function that might needs to be overridden needs to be decleared as virtual
//a child contract that will override that function will use override keyword
contract A{
    //ek function banao jo children contract override karega
    function foo() public pure virtual returns (string memory){
        return "A";


    }
}

contract B is A {
    //yaha pe apun override karenge but
    //iss tareeke se tak baki contracts bhi override kar paye baad mein
    //so both override and virtual 
    function  foo() public pure virtual override returns(string memory){
        return "B";
    }


}
contract C is B{
    function foo() public pure virtual  override returns (string memory){
        return "C";
    }
}
// Yaha pe yaad rakhna jo contract right mein hai voh parent act karega if a pfucntion
// jo bohat baar declared hai dusre contracts mein
contract D is B, C {
    //agar D.foo() returns karoge toh C milega coz that is the parent 
    //so override karne ke liye hume B and C dono ko override karna padega
    function foo() public  pure override(B,C) returns (string memory){
        return super.foo();// super is a special keyword to call functions
    }

}
contract E is B,C{
    function foo() public pure override (C, B) returns (string memory) {
        return super.foo();
    }
}










