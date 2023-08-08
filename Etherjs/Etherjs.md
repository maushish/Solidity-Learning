PROVIDER: Its a class which provides abstraction(Short form) for a connection to Eth networks. It provides read only access to the blockchain networks(We will use Infura to read On-chain data)

SIGNER: Its a class which has access to pvt key which can sign messages/txns.

Installation
```
npm install --save ethers
```
After installation in your js file do this to import it 
```Javascript
    const {ethers}=require("ethers")
```
Now to make your system as node go signup on infura and generate an API key and copy the URL(Mainnet We can't use testnet for reading data)
Then go into your JS file 
```Javascript
    const providers = new ethers.providers.JsonRpcProvider(`URL`);
    //creating a function to ask for some data and it will be an async function
    const heyEthers=async()=>{
        const block =await provider.getBlockNumber();//Creating block variable to get the block number
        console.log(block)//Block number
    }
    //calling function to test this
    heyEthers();

```
Now in your terminal 
```node YOURJSFILENAME.js```
You will see a number that is your block number on which your TXN happened.
To verify it go on etherscan and paste the number.

Now let's try to check an account Balance
In your js file
```Javascript
    //In your heyEthers Function
    const tellMeTheBalance=await provider.getBalance("PASTE THE ADDRESS")
    console.log(tellMeTheBalance)//Balance of the address that you pasted 
```
Now in your terminal 
```node YOURJSFILENAME.js```
You will see a number that is your balance available on the address
Now you will notice it is in Big Numbers
To get it in readable format
```Javascript
    //In the heyEthers function 
    const BalanceInETH=ethers.utils.formatEther(balance);
```
Now after running it on terminal you will get a number , its unit is in Eth not USD.
```JS
     //To convert amt into BigNumber use 
    const inBN=ethers.utils.parseEth(BalanceInETH);

```
Now to write on blockchain we need two things that are SIGNER and METAMASK WALLET
So setup your metamask wallet before reading further!
Now here is a dummy smart contract in solidity to play with 

```solidity

        // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.19;
    contract dummy{
        string public name="Wallet";
        uint num;
        //set two variables
        function setValue(uint _num) public {
            num=_num;
        }
        function getValue() public view returns(uint) {
            return num;

        }
        function sendEthToContract() public payable{
            //Put amt in msg.value

        }
        function contractBalance() public  view returns (uint){
            return address(this).balance;
            //get the amt stored in contract
        }
        function sendEthToUser(address _user) public payable {
            payable (_user).transfer(msg.value);
            //sending ETHER to another user
        }
        function accountBalance(address _address)public  view returns(uint){
            return (_address).balance;
        }
    }
```

