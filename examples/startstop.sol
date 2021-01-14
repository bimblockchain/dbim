pragma solidity ^0.6.0;

//SPDX-licence-identifier-mylicence.

contract StartStopUpdate{
    address owner;
    bool public paused;
    
    //constructor is called during contract deployment only
    constructor() public {
        owner = msg.sender; //owner of the contract is the sender
    
    
    }
    function setPaused(bool _paused) public {
        require(msg.sender ==owner, "you Are not the owner");
        paused = _paused; //if the owner of the contrract triggers it then it works, if not then no.
        
    }
    
    function sendMoney() public payable {
        
    }
    
    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, "you are not the owner");  /if another account,other than the onwer,  tries to withdraw it will not work
        require(!paused, "contract is paused");
        _to.transfer(address(this).balance);
        
    }
    //for some reason the destroy does not work-?
    function destroySmartContract(address payable _to) public{
        require(msg.sender == owner, "you are not the owner");
        selfdestruct(_to);
    }
}
