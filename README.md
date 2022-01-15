# dbim
decentralised Building Information Modelling

This is the third prototype of the archchain.cc project, it involves using IPFS, web3.py and Python on dynamo/Revit and blender, along with a series of smart contracts that execute a variety of roles. The main BIM representations we use are based on Topologic.app for elegance eand simplicity, even thought the Contracts and code can handle .ifc and full BIM files.

the contracts provide:

* material passport integration
* basic decentralised BIM
* basic escrow accounts
* basic tokenisation examples
* basic staking mechanisms



We are slowly building a series of templates for use in **decentralised building information modelling**.
Our Tools for Blender can also be used to drive any creative and design project that needs a blockchain for project management.

* Model for on-Chain NFT of BIM and of topologic models:
  - encode .ifc on base64
  - save it as an NFT : here the mint function should save the tokenURI onchain
  - you then have an .ifc definition and a topologic definition on chain.
  - create then the rendering engine to render this on the web browser by using IFC.js
  - create a dashboard then of abstract generalisation to render the circular economy between retrieving materials from one building to another.

  
