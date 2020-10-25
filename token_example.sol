pragma solidity ^0.6.0;

contract InheritanceModifierExample {
    
    
    //restructure this so that the owner is set in a separate contract
    //and that the tokeen transactions are emitted as an event.
    
    mapping(address => uint) public tokenBalance;
    
    address owner;
    uint tokenPrice = 0.1 ether;
    
    constructor() public {
        owner = msg.sender;
        tokenBalance [owner] = 100;
    }
    
    function creeateNewToken() public {
        require(msg.sender == owner, "you are not allowed, you are not the owner");
        tokenBalance[owner]++;
        
    }
    
    function burnToken() public {
        require(msg.sender == owner, "you are not allowed");
        tokenBalance[owner]--;
        
    }
    
    function purchaseToken() public payable{
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "not enough tokens");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value /tokenPrice;
        
    }
    
    
    
}
