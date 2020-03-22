pragma solidity ^0.5.13;

contract tokens{
    
    uint public balanceReceived;
    
    
    function receiveMoney() public payable {
        balanceReceived += msg.value;
        
    }
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function withdrawMoney() public{
        address payable to = msg.sender;
        to.transfer(this.getBalance());
    }
}
