//SPDX-License-Identifier: MIT
//check compiler version needed for OpenZeppelin
pragma solidity ^0.6.2;

//@title:NFT token contract for minting choice components
//@dev: using OpenZeppelin templates for NFT ERC721, Ownable, pullpayment and pausable functions for security
//@
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.1.0/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.1.0/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.1.0/contracts/payment/PullPayment.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.1.0/contracts/utils/Pausable.sol";


//@dev: first phase is to add the choice components to the contract
//@dev: second phase is to mint the components into NFTs
//@dev: third phase, if needed, is to transfer ownership of the components to a new address



contract ComponentToken is ERC721, Ownable, PullPayment, Pausable {

//@dev: keep this
//rehaul the code for Solidity 0.8.0 - for example safe math will no tlonger be needed
using SafeMath for uint256;
  uint256 public _tokenIds;
  uint256 public _componentItemIds;
  mapping (uint256 => componentItem) private _componentItems;

  //@dev: creating the componentItem as a struct, tokenURI is the IPFS URI, choice is a string that takes the components IDs from choice
  //@dev: the stuct and constructo arre probably fine, it is the rest of the functions that all need rehauling.
  //@dev: perhaps choice nomenclaturee can take a mapping:
  // 8:Cluster, 7:CellComplex, 6:Cell, 5:Shell, 4:Face, 3:Wire, 2:Edge, and 1:Vertex.

  enum Topology {Cluster, Cellcomplex, Cell, Shell, Face, Wire, Edge } //Enum
  Topology choice;
  Topology constant defaultChoice = Topology.Cluster;

  function setCluster() public {
      choice = Topology.Cluster;
  }

  function setCellcomplex() public {
      choice = Topology.Cellcomplex;
  }

  function setCell() public {
      choice = Topology.Cell;
  }

  function setShell() public {
      choice = Topology.Shell;
  }

  function setFace() public {
      choice = Topology.Face;
  }

  function setWire() public {
      choice = Topology.Wire;
  }

  function setEdge() public {
      choice = Topology.Edge;
  }


  function getChoice() public view returns (Topology) {
      return choice;
  }

  function getDefaultChoice() public pure returns (uint) {
      return uint(defaultChoice);
  }


    struct componentItem {
      address seller;
      uint256 price;
      string tokenURI;
      bool exists;
    }

    constructor() ERC721("ComponentToken", "CTK") Pausable () public {

    }

//rehaul the code below- add one function to add components, mint components, establish ownership of _components.

    modifier componentItemExist(uint256 id) {
      require(_componentItems[id].exists, "Not Found");
      _;
    }

    //@notice: Adds an componentItem after checking for price to be above 0,
    //@return: advances the register of items by +1, function is active when not paused

      function addcomponentItem(uint256 price, string memory tokenURI) whenNotPaused public {
        require(price > 0, "Price can not be 0");
        _componentItemIds++;
        _componentItems[_componentItemIds] = componentItem(msg.sender, price, tokenURI, true);
      }


      //@notice: retrieves an componentIten
      //@return: id, the price, and the IPFS token URI
        function getcomponentItem(uint256 id) whenNotPaused public view componentItemExist(id) returns(uint256,uint256, string memory){
          componentItem memory componentItem = _componentItems[id];
          return (id, componentItem.price, componentItem.tokenURI);
        }

      //@notice: executes a purchase of an item, after a check that the item exists.
      //@notice: we need to implement a contract that facilitates collaborative transfer and management (say from a DAO)
      //@param: checks that the price is value offered is higher than the price.
      //@return: advances the item id, mints the actual ERC721 token connected with the componentwork, assigns to the seller.
      //@return: sets the IPFS URI and transfers the ERC721 token


        function purchasecomponentItem(uint256 componentItemid) whenNotPaused external payable componentItemExist(componentItemid) {
          componentItem storage componentItem = _componentItems[componentItemid];
          require(msg.value >= componentItem.price, "Your bid is too low");
          _tokenIds++;
          _safeMint(msg.sender, _tokenIds);
          _setTokenURI(_tokenIds, componentItem.tokenURI);
          _asyncTransfer(componentItem.seller, msg.value);
        }


        function getPayments() whenNotPaused external {
          withdrawPayments(msg.sender);
        }




}
