pragma solidity ^0.6.4;
    //This sets the actual name of the contract
contract BIMVariables{
        //These are examples of the variables we will use in the contracts.
        //Boolean Variables 
    bool public myBool;
    
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
        //unsigned integer 
    uint public myUint;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    
        //integers wrapping around their numerical boundaries
        //once they reach their boundaries they return to the begining/end.
        //note the increment and decrement functions
    
    uint8 public myUint8;
    
    function incrementUint() public {
        myUint8++;
    }
    
    function decrementUint() public {
        myUint8--;
    }
    
        //this sets and declares addresses.
    address public myAddress;
    
    function setmyAddress(address _address) public {
        myAddress = _address;
    }
      //get balance of an address-
    function getBalanceOfAddress() public view returns(uint) {
        return myAddress.balance;
    }
    
    string public myDifference = "this is an IPFS HASH";
    
    function setmyDifference(string memory _myDifference) public {
        myDifference = _myDifference;
    }
    
    
}
