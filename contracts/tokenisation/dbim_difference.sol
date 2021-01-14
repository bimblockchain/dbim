pragma solidity ^0.6.0;


contract dbim {
    string public difference = "I_pretend_to_be_an_IPFS_hash";
    
    
        //unsigned integer 
    uint public myUint;
        //unsinged integer for performance benchmarks
    uint public myEnergy;
    uint public myStructure;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    
    function setMyEnergy(uint _myEnergy) public {
        myEnergy = _myEnergy;
    }
    
    function setMyStructure(uint _myStructure) public {
        myStructure = _myStructure;
    }
    
    function setIPFShash(string memory _difference) public{
    difference = _difference;
    }
    
}
