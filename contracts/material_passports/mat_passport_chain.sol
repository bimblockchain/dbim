//SPDX-License-Identifier: MIT

pragma solidity ^0.6.2;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.1.0/contracts/access/Ownable.sol";


// @dev: This creates a  simple struct to map three integers as ids of materials, processes, and outputs encapsulating material passports.
// @user: it takes into account ids passed on from Blender/Topologic as dictionaries belonging to lists.
// @user: it also adds the first state of a supply chain for tracking a material through its stages-
// @dev: to be added- reference and a mapping of the material to an address, to show onwership through the supply chain.
contract Mat_passport is Ownable{
   struct MaterialID {
      //maybe the address of the previous contract // string prevContract;
      uint inputID;
      uint processID;
      uint outputID;
   }

//Enum is used to track status on the supply chain - expand here with more supply chain events to frontend-
   enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    // Default value is the first element listed in
    // definition of the type, in this case "Pending"
    Status public status;
    MaterialID materialID;

    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function getStatus() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }

    //Set the materialID
   function setMaterialID(uint _inputID, uint _processID, uint _outputID ) public {
      materialID = MaterialID(_inputID, _processID, _outputID);
   }

   //Get the ID of the input to the fabrication process
   function getInputID() public view returns (uint) {
      return materialID.inputID;
   }

   //Get the ID of the output product of the tranformation
   function getOutputID() public view returns (uint) {
      return materialID.outputID;
   }

   //Get the ID of the process used in the transformation of the input into the output
   function getProcessID() public view returns (uint) {
      return materialID.processID;
   }
}
