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

v = Vertex.ByCoordinates(10,20,30)
message = str(v.String())
w3 = Web3(HTTPProvider(infura_url))

smartContract = w3.eth.contract(address=contract_address, abi=contract_abi)

receipts = []
nonce = w3.eth.getTransactionCount(wallet_address)
tx_dict = smartContract.functions.setIPFSHash(message).buildTransaction({
    'chainId' : 3,
    'gas' : 210000,
    'gasPrice' : w3.toWei('50', 'gwei'),
    'nonce' : nonce,
})

signed_tx = w3.eth.account.sign_transaction(tx_dict, wallet_private_key)
tx_hash = w3.eth.sendRawTransaction(signed_tx.rawTransaction)
tx_receipt = w3.eth.waitForTransactionReceipt(tx_hash, timeout=120, poll_latency=0.1)
receipts.append(tx_receipt)

nonce = w3.eth.getTransactionCount(wallet_address)
tx_dict = smartContract.functions.setMyUint(number).buildTransaction({
    'chainId' : 3,
    'gas' : 210000,
    'gasPrice' : w3.toWei('50', 'gwei'),
    'nonce' : nonce,
})
signed_tx = w3.eth.account.sign_transaction(tx_dict, wallet_private_key)
tx_hash = w3.eth.sendRawTransaction(signed_tx.rawTransaction)
tx_receipt = w3.eth.waitForTransactionReceipt(tx_hash, timeout=120, poll_latency=0.1)

receipts.append(tx_receipt)

outputList = []
for tx_receipt in receipts:
    receipt = []
    receipt.append('blockHash: '+str(tx_receipt['blockHash']))
    receipt.append('blockNumber: '+str(tx_receipt['blockNumber']))
    receipt.append('contractAddress: '+str(tx_receipt['contractAddress']))
    receipt.append('cumulativeGasUsed: '+str(tx_receipt['cumulativeGasUsed']))
    receipt.append('from: '+str(tx_receipt['from']))
    receipt.append('gasUsed: '+str(tx_receipt['gasUsed']))
    receipt.append('logs: '+str(tx_receipt['logs']))
    receipt.append('to: '+str(tx_receipt['to']))
    receipt.append('transactionHash: '+str(tx_receipt['transactionHash']))
    receipt.append('tansactionIndex: '+str(tx_receipt['transactionIndex']))
    outputList.append(receipt)

brepString =  smartContract.functions.getIPFSHash().call()
print(brepString)
v2 = Topology.ByString(brepString)
print(v2)

print(outputList)