pragma solidity ^0.5.13;

contract tokens{
    
    //somehow the second time I tried this the console threw an error on "solidity identifire not unique"
    //was not able to debug so copied the code from the initial dBIM repostory.
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
    //This allows us to specify which third adress to withdraw ALl of the money to.
    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }
}
