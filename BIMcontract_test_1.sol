pragma solidity ^0.6.0;


//this is the name of the contract, then the variables- they need to be declared before deployment
contract BIMcontract{
    string public difference = "I_pretend_to_be_an_IPFS_hash";
    int public version = 1;
    
    //the following is a function setting variables. the fact that it is public means that it can be called by another application.
function setBIMcontract(string memory _difference) public{
    difference = _difference;
    int a; //local variable will be saved in stack
    int [] memory y; // by delacring memory, it is saved in memoery.
     //the ETH virtual machine stores things in three areas: storage *persistent and expensive, memory *like RAM, holdes temporary value, does not cost gas, Stack *holds local function variables, free to be used.
    
}
}
