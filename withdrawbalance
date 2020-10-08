pragma solidity ^0.5.13;

contract withdrawbalance {
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
        
    }
    
    function sendMoney() public payable {
        
    }
    
    function withdrawAllMoney(address payable _to) public {
        _to.transfer(address(this).balance);
    }
}
