//SPDX-License-Identifier: MIT

pragma solidity ^0.6.2;

//for @Arlav on Sunday: Circuit Breaker pattern, comments per spec, tests!

///@title:buildingToken marketplace
///@author: Arlav
///@notice: you need a user interface and IPFS set up to use interface
///


/** @dev: simple impleementation of an ERC721 token marketplace, 
 * with the addition of a circuit breaker desisgn and pullpayment & escrow accounts
 * to prevent reentrancy attacks. Pausable is used to pause all functions by the owner
 * as a circuit breaker pattern. Safe Math is used for uint256 to preveent overflows
 * Addresses on ethereum can upload buildingwork which is tokenised into ERC721 when sold.
 * @notice: you can use this as a simple buildingToken marketplace for images or other digital buildingefacts
*/

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/payment/PullPayment.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Pausable.sol";


contract buildingToken is ERC721, Ownable, PullPayment, Pausable {


using SafeMath for uint256;



  uint256 public _tokenIds;
  uint256 public _buildingItemIds;
  mapping (uint256 => buildingItem) private _buildingItems;


///@dev: creating the buildingItem as a struct, toeknURI is the IPFS URI 
  struct buildingItem {
    address seller;
    uint256 price;
    string tokenURI;
    bool exists;
  }


  constructor() ERC721("buildingToken", "building") Pausable () public {
      
  }

 
  modifier buildingItemExist(uint256 id) {
    require(_buildingItems[id].exists, "Not Found");
    _;
  }


//@notice: Adds an buildingItem after checking for price to be above 0,
//@return: advances the register of items by +1, function is active when not paused

  function addbuildingItem(uint256 price, string memory tokenURI) whenNotPaused public {
    require(price > 0, "Price can not be 0");
    _buildingItemIds++;
    _buildingItems[_buildingItemIds] = buildingItem(msg.sender, price, tokenURI, true);
  }

//@notice: retrieves an buildingIten
//@return: id, the price, and the IPFS token URI
  function getbuildingItem(uint256 id) whenNotPaused public view buildingItemExist(id) returns(uint256,uint256, string memory){
    buildingItem memory buildingItem = _buildingItems[id];
    return (id, buildingItem.price, buildingItem.tokenURI);
  }

//@notice: executes a purchase of an item, after a check that the item exists.
//@param: checks that the price is value offered is highr than the price.
//@return: advances the item id, mints the actual ERC721 token connected with the buildingwork, assigns to the seller.
//@return: sets the IPFS URI and transfers the 

  function purchasebuildingItem(uint256 buildingItemid) whenNotPaused external payable buildingItemExist(buildingItemid) {
    buildingItem storage buildingItem = _buildingItems[buildingItemid];
    require(msg.value >= buildingItem.price, "Your bid is too low");
    _tokenIds++;
    _safeMint(msg.sender, _tokenIds);
    _setTokenURI(_tokenIds, buildingItem.tokenURI);
    _asyncTransfer(buildingItem.seller, msg.value);
  }


  function getPayments() whenNotPaused external {
    withdrawPayments(msg.sender);
  }




}
