//Contract based on https://docs.openzeppelin.com/contracts/3.x/erc721
// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

//deployed on ropsten with ArchChainONE account: 0x3e65E95E32D3414FDBBCd4ed0753EfdA6980F2Ce

//@dev: sets up OpenZeppelin lirbaries needed for an NFT
//@dev: plus additional libraries needed for pause and access control
//for remix use the 3.4 version of the contract
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/token/ERC721/ERC721Burnable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/utils/Pausable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/access/AccessControl.sol";


//for testing with truffle/brownie - uncomment these lines to run with a local framework
//import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
//import "@openzeppelin/contracts/token/ERC721/ERC721Burnable.sol";
//import "@openzeppelin/contracts/utils/Pausable.sol";
//import "@openzeppelin/contracts/utils/Counters.sol";
//import "@openzeppelin/contracts/access/AccessControl.sol";


//@dev: contract setup with access control
contract TopoToken is ERC721, ERC721Burnable, Pausable, AccessControl {
  bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
  bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

//@dev: used for counting the tokens.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

//@dev: sets up three roles: admin, pauser (for security) and minter
//@dev:admin is also the owner
    constructor() public ERC721("TopoToken", "TPK")
    {
      _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
      _setupRole(PAUSER_ROLE, msg.sender);
      _setupRole(MINTER_ROLE, msg.sender);

    }

//@dev: pauses the contract in case of an emergency
        function pause() public
        {
            require(hasRole(PAUSER_ROLE, msg.sender));
            _pause();
        }

//@dev: unpauses a paused contract
        function unpause() public
        {
            require(hasRole(PAUSER_ROLE, msg.sender));
            _unpause();
        }

//@dev:mints the NFT
    function mintNFT(address recipient, string memory tokenURI)
        public returns (uint256)
    {
      require(hasRole(MINTER_ROLE, msg.sender), "caller is not a Minter");
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }
}
