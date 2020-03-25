pragma solidity ^0.6.0;

contract StartStopUpdate{
    address owner;
    bool public paused;
    
    //constructor is called during contract deployment only
    constructor() public {
        owner = msg.sender;
    
    
    }
    function setPaused(bool _paused) public {
        require(msg.sender ==owner, "you Are not the owner");
        paused = _paused;
        
    }
    
    function sendMoney() public payable {
        
    }
    
    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, "you are not the owner");
        require(!paused, "contract is paused");
        _to.transfer(address(this).balance);
        
    }
    //for some reason the destroy does not work-?
    function destroySmartContract(address payable _to) public{
        require(msg.sender == owner, "you are not the owner");
        selfdestruct(_to);
    }
}
