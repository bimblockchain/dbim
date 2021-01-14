pragma solidity ^0.6.0;


contract dbim {
    string public difference = "I_pretend_to_be_an_IPFS_hash";
    
    
        //unsigned integer 
    uint public myUint;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    
    function setIPFShash(string memory _difference) public{
    difference = _difference;
    }
    
}
