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
        string public name="dummy";
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
Now go and get some GETH goerli eth for testing and development 
Now deploy the above dummy code on remix and copy ABI
If you don't know how look it up on YT

After having some geth make a new js file and call it interactionWithSC.js

In that file import Ethers and provider and after that

```Javascript
    const walletAddress="PASTE_WALLET_ADDRESS";
    const walletABI=[
	{
		"inputs": [],
		"name": "sendEthToContract",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_user",
				"type": "address"
			}
		],
		"name": "sendEthToUser",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_num",
				"type": "uint256"
			}
		],
		"name": "setValue",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_address",
				"type": "address"
			}
		],
		"name": "accountBalance",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "contractBalance",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getValue",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "name",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]

//paste the ABI
//creating a function to interact with smart contract


const contractInteraction=async=()=>{
    const walletContract= new ethers.Contract(walletAddress ,walletABI,provider)//Defining a variable called walletContract which can read any data on the blockchain
    const contractName= await walletContract.name();
    console.log(contractName);
    const num=await walletContract.num();
    console.log(num);//output num value

    const balanceInSmartContract=await walletContract.contractBalance();
    console.log(balanceInSmartContract);//output:balance of the smart contract

    const userBalance=await walletContract.accountBalance("PASTE_THE_ADDRESS");
    console.log(userBalance);//user balance



}
contractInteraction();
```
Run this file on Terminal using node command 
Now you will again see many values in BigNumbers go and change them into readable form (Time to do yourself🤩)

Now take some rest have some coffee ☕ 😁
***Now How to write on Blockchain using etherjs**
Go and watch this video on how to add metamask login button in your react app: 
https://www.youtube.com/watch?v=xKaJ-GGoikk

Now make sure you imported etherjs  paste your ABI code too in your App.js file of react app
Now after watching that tutorial your code might be looking something like this
(there are some changes here you need to run your brain no spoonfeeding brainstorum use GPT & BARD for answers)
```JS
//before this import useEffect() from react
    function App(){
        const walletAddress="PASTE_YOUR_ADDRESS";
        useEffect{()=>{
            const walletABI="PASTE_ABI";
            const writeContract=new ethers.providers.Web3Provider(window.ethereum);
            await prvider.send("eth_requestAccounts",[]);
            const signer=provider.getSigner();
            //defining a contract variable to write data
            const contract =new ethers.Contract(walletAddress, walletABI, signer);
            await contract.setValue(2);//calling set function
            }
            writeCOntract();
            },[]};  



```
Now run the react app and simple click confirm on your metamask txn and boom you made your first txn using smart contract
Now to check your value by running the getValue() function on terminal.

Now here are some extra functions that you can try in your app.js
```JS
    //TO transfer eth to smart contract
    await.contract.sendEthToContract({value:ethers.utils.parseEther("0.001")});
    //TO transfer eth to user
    await.contract.sendEthToUser("PASTE_THE_RECIEVER_ADD",{value:ethers.utils.parseEther("0.1")})
//THE Reciever should be of SAME TEST NETWORK

```
