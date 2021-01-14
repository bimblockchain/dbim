pragma solidity ^0.6.0;

contract simplebank{
    
    //this creates a simple mapping of an ethereum address to a number
    mapping(address => uint) public balanceReceived;
    
    
    //This returns the full amount of ETH the contract holds
    function getBalance() public view returns(uint) {
        return address(this).balance;
        
    }
    
    //
    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
        
    }
    
    //This withdraws only the specified amount of money an account has sent. 
    function withdrawMoney(address payable _to, uint _amount) public {
        require (balanceReceived[msg.sender] >= _amount, "not enough funds");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
        
    }
    
    //this withdraws all the money that an account has send to the contract 
    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSend);
        
    }
}
