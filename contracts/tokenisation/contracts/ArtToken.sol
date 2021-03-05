//SPDX-License-Identifier: MIT

pragma solidity ^0.6.2;

///@title:ArtToken marketplace
///@author: Arlav, withh code used from Bernard 3000 / openzeppelin.
///@notice: you need a user interface and IPFS set up to use interface



/** @dev: simple impleementation of an ERC721 token marketplace, 
 * with the addition of a circuit breaker desisgn and pullpayment & escrow accounts
 * to prevent reentrancy attacks. Pausable is used to pause all functions by the owner
 * as a circuit breaker pattern. Safe Math is used for uint256 to preveent overflows
 * Addresses on ethereum can upload artwork which is tokenised into ERC721 when sold.
 * Contract compiles on truffle and remix with solc 0.6.2.
 * @notice: you can use this as a simple ArtToken marketplace for images or other digital artefacts
*/

//importing the ERC721 token contract to use as template
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/payment/PullPayment.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";

contract ArtToken is ERC721, Ownable, PullPayment, Pausable {


using SafeMath for uint256;



  uint256 public _tokenIds;
  uint256 public _artItemIds;
  mapping (uint256 => ArtItem) private _artItems;


///@dev: creating the ArtItem as a struct, toeknURI is the IPFS URI 
  struct ArtItem {
    address seller;
    uint256 price;
    string tokenURI;
    bool exists;
  }


  constructor() ERC721("ArtToken", "ART") Pausable () public {
      
  }

 
  modifier artItemExist(uint256 id) {
    require(_artItems[id].exists, "Not Found");
    _;
  }


//@notice: Adds an ArtItem after checking for price to be above 0,
//@return: advances the register of items by +1, function is active when not paused

  function addArtItem(uint256 price, string memory tokenURI) whenNotPaused public {
    require(price > 0, "Price can not be 0");
    _artItemIds++;
    _artItems[_artItemIds] = ArtItem(msg.sender, price, tokenURI, true);
  }

//@notice: retrieves an artIten
//@return: id, the price, and the IPFS token URI
  function getArtItem(uint256 id) whenNotPaused public view artItemExist(id) returns(uint256,uint256, string memory){
    ArtItem memory artItem = _artItems[id];
    return (id, artItem.price, artItem.tokenURI);
  }

//@notice: executes a purchase of an item, after a check that the item exists.
//@param: checks that the price is value offered is highr than the price.
//@return: advances the item id, mints the actual ERC721 token connected with the artwork, assigns to the seller.
//@return: sets the IPFS URI and transfers the 

  function purchaseArtItem(uint256 artItemid) whenNotPaused external payable artItemExist(artItemid) {
    ArtItem storage artItem = _artItems[artItemid];
    require(msg.value >= artItem.price, "Your bid is too low");
    _tokenIds++;
    _safeMint(msg.sender, _tokenIds);
    _setTokenURI(_tokenIds, artItem.tokenURI);
    _asyncTransfer(artItem.seller, msg.value);
  }


  function getPayments() whenNotPaused external {
    withdrawPayments(msg.sender);
  }




}