pragma solidity ^0.6.0;

contract simplemapping{
    //mapping map a key type to a value type, then the variable name is declared
    //key can be any vairable other than another mapping or smart contract
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    
    bool myVar1 = false;
    bool myVar2 = false;
    bool myVar3 = false;
    bool myVar4 = false;
    
    
    //the following function allows you to set the index of a uint to map as true in the mapping
    //instead of mapping as false (which is set globaly at the mapping setting above.)
    function setValue(uint _index) public {
        myMapping[_index] = true;
        
    }
    
    function setMyAddresToTrue() public{
        myAddressMapping[msg.sender] = true;
        
    }
    
    // use this code to set MyVar1: function setmyVar1ToTrue() public
}
