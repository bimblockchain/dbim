ToDo:

done Make a txt with contract Addresses on ropsten and Rinkby
done Include, contract abi and code?

done read with web3.py from the contract
done write from web3.py TO the contract-(increase gas price and wei number)

- move an ERC20 Token from one address to another in a contract?
  * scale to th stigmergic coordination and to ERC20 staking.



Code:

Building Tokenisation - series of experiments-
0.refactor the tokenisation smart contracts and python script.-start simple.
1. smart contract creating a simple NFT
2.trigger the minting of the NFT via command line Python
3.read the ownership of the NFT through python.
4. transfer the NFT to another address via Python


Describe here the setup

COMBINE THE STRING AND TOKEN SOLIDITY CODE.
write to the contract a string that contains the topology, then tokenise that,
that
0.build a simple cell in Topologic, analyse it into edges, that have tags and unique IDs-
    unique IDs for columns, and beams and faces. Topologic generates a string that contains the topology _tokenIds
    Sample for a vertex is: string: ( "CASCADE Topology V1, (c) Matra-Datavision Locations 0 Curve2ds 0 Curves 0 Polygon3D 0 PolygonOnTriangulations 0 Surfaces 0 Triangulations 0 TShapes 1 Ve 1e-07 10 20 30 0 0 0101101 * +1 0 ")
    The string uniquely declares the Locations

    * Generate strings for other components :: columns, slabs, etc - can these be mapped to IFC?
    * can these be used as an ontology

Set up a python virtual environment with py 3.9
activate it the environments
Pip install web3
Pip install Ipfshttpsclient
go to the site pachages of the virtual environment, then pick up web3 & IPFS packages
then copy to the site pakcages to topologic
and then restart blender.


Standard tutorial on metamask - using the contracts and


import JSON-


    Process:

1. On smart contact keeps track of files "file_ledger" - a second smart contract keeps track of NFTs "topology_ledger"


  * One that sends the whole topology file to IPFS and retrieves a Hash - This is the master hash for the whole building.

* The topologic-setup needs to build a set of components.
-What kind of dictionaries should we attach to components ? Material IDs, Process ID, Output IDs?

Each component information is first sent to IPFS, where the metadata for the token are created, then Each component is then sent through a python node to be minted as an NFt token and to IPFS.
We then test-read the components and re-assemble the building, to test that


 triggered from inside the software that sends a topology string to the "topology_ledger"
  a fourth python script that reads from "topology_ledger"
  a fifth python script that does transfer of tokens

2. Mint a token on "Topology Ledger" -DONE
3. transfer it to another address

Send the unique IDs for the columns to the smart contract and trigger the creation of an NFT for the first column.
2.1 the NFT will old the Topologic string and the IPFS STRING
3. trigger the minting of the second, third, fourth column.
4.upload to IPFS the topologic file, has it and mint ANOTHER NTF that holds the topology.
5.through python Read the Topology, and recreate it in say Blender or in topologic in another computer
6.transfer the NFTs to another address (representing a circular economy)
7. Should we have the creation of a series of topologic Contracts (vertices, edges etc?)
Do all of this through PYTHON interfacing with Solidity.

transaction receipts.

re-set MACOS so IPFS can work?
When you have python to IPFS working develop it into a Sverchok node so that you can tokenise Blender files themselves,





0.test smart simple contract functions with python equivalents


1.Add web3.py code to write a Blender file to IPFS
2.create a token using that Blender file.

Use Python to write a file to IPFS
Take that hash and feed it into a python script that mints a token to the BLockchain
Use Python to Write the interface  code for the buildingcomponent.
Test the creation of a NFT through python
Create a simple React page that keeps track of a Topologic Model.



import web3.py into blender on Windows and OSX
Sverchok Nodes for Web3.py



CPython on Grasshopper - what kind of plugin -




Research:
How can a contract own tokens? Can we have a token own a contract, which own tokens?

Design diagrams for template smart contracts,
for example
simple dbim contract ,
simple escrow contract,
simple ERC20 contract,
simple ERC721 contract,
simple ERC115 contract,
simple digital twin contract.

material passports:
I would like to experiment with two nodes that we have not used thus far (Topology.DecodeInformation and Toplogy.EncodeInformation). These write out (to an excel CSV file) and read back in all the dictionaries (keys and values) of a topology and its sub-topologies and re-construct those dictionaries and assign them to the correct (sub)components. if we can save the JSON of a sverchok definition, the various BREP strings and their associated CSV files to IPFS and hash the location to the contract and read it back in and reconstruct the topologies along with their dictionaries, wouldn't we  have a really good material passport system? What would be missing?
