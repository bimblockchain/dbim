contract_address = "0x76c2E322138b6cC9D5Fa6D759f4B06BCB5B08b2B"
wallet_private_key = "XXXXXXXXX"
wallet_address = "0x7E01CF301C0F55f0A50100D67cA16aCcD75aE1d8"
infura_url = "https://ropsten.infura.io/v3/bc0151acb1204cacadd049ab3ac000eb"
path = "C:\\Users\\wassimj\\.conda\\envs\\Blender377\\lib\\site-packages"
#message = "Hello From Blender"
number = 377;

contract_abi = "[{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"address\",\"name\":\"previousOwner\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"newOwner\",\"type\":\"address\"}],\"name\":\"OwnershipTransferred\",\"type\":\"event\"},{\"inputs\":[],\"name\":\"IPFSHash\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"getIPFSHash\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"myUint\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"owner\",\"outputs\":[{\"internalType\":\"address\",\"name\":\"\",\"type\":\"address\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"renounceOwnership\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"string\",\"name\":\"_IPFSHash\",\"type\":\"string\"}],\"name\":\"setIPFSHash\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"_myUint\",\"type\":\"uint256\"}],\"name\":\"setMyUint\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"newOwner\",\"type\":\"address\"}],\"name\":\"transferOwnership\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"}]"
import time
import sys
sys.path.append(path)
from web3 import Web3, HTTPProvider

from topologic import Vertex, Topology
import cppyy


w3 = Web3(HTTPProvider(infura_url))

smartContract = w3.eth.contract(address=contract_address, abi=contract_abi)
brepString =  smartContract.functions.getIPFSHash().call()
print(brepString)
v2 = Topology.ByString(brepString)
v2.__class__ = Vertex
print([v2.X(), v2.Y(), v2.Z()])
