pragma solidity ^0.5.13;

contract tokens{
    
    uint public balanceReceived;
    
    
    function receiveMoney() public payable {
        balanceReceived += msg.value;
        
    }
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    //this withdraws money to the address that called the contract, through the msg.sender properties.
    function withdrawMoney() public{
        address payable to = msg.sender;
        to.transfer(this.getBalance());
    }
    //This allows us to specify which third address to withdraw money to.
    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }
}
