
#@dev: code still needs refactoring for minting. Currently it is connected with Topologic
#@dev: try passing a simple string for the minting.
#refer to credentials.MD for public test ethereum addresses
contract_address = "0x41b101e30124ff0f6ee8c091e00178d87eb3b4c5"
wallet_private_key = "2366b847b1452a873139138443b88957f084e4add05f00d3074497ed404db0d0"
wallet_address = "0x59DcC1e1B1F43BaD14DA3b8040995677d6fc923E"
infura_url = "https://ropsten.infura.io/v3/bc0151acb1204cacadd049ab3ac000eb"

#@dev entries to use with the anaconda python inside blender/dynamo
path = "/opt/anaconda3/lib/python3.8"
#['', '/opt/anaconda3/lib/python38.zip', '/opt/anaconda3/lib/python3.8', '/opt/anaconda3/lib/python3.8/lib-dynload', '/opt/anaconda3/lib/python3.8/site-packages', '/opt/anaconda3/lib/python3.8/site-packages/aeosa']

contract_abi =  "[{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"address\",\"name\":\"previousOwner\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"newOwner\",\"type\":\"address\"}],\"name\":\"OwnershipTransferred\",\"type\":\"event\"},{\"inputs\":[],\"name\":\"owner\",\"outputs\":[{\"internalType\":\"address\",\"name\":\"\",\"type\":\"address\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"renounceOwnership\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"newOwner\",\"type\":\"address\"}],\"name\":\"transferOwnership\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"}]"

import time
import sys
sys.path.append(path)
from web3 import Web3, HTTPProvider

web3 = Web3(Web3.HTTPProvider(infura_url))

#from topologic import Vertex, Topology
#import cppyy

#v = Vertex.ByCoordinates(10,20,30)
message = str('setecastronomy')
w3 = Web3(HTTPProvider(infura_url))


smartContract = w3.eth.contract(address=contract_address, abi=contract_abi)

receipts = []

#the next function calls mints the NFT
nonce = w3.eth.getTransactionCount(wallet_address)
tx_dict = smartContract.functions.mintNFT(message).buildTransaction({
    'chainId' : 3,
    'gas' : 210000,
    'gasPrice' : w3.toWei('50', 'gwei'),
    'nonce' : nonce,
})
