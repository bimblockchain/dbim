#simple tokenisation web python interface
#input parameters from Dynamo

#to talk to a contract, you need the contract address, the network chain id(), the contract abi, and the list of function.
#you need the contract abi as an interface for the functions that we will need to call
#CHANGE THE CONTRACT WITH THE TOKEN CONTRRACT ABI
contract_abi =

#name the smart contract-
smartContract = w3.eth.contract(address=contract_address, abi=contract_abi)


#the next transaction builds the trransaction for adding a component token- by using the addBuildingItem function-
#question: how to trigger the struct function?
receipts = []
nonce = w3.eth.getTransactionCount(wallet_address)
tx_dict = smartContract.functions.addbuildingItem(message).buildTransaction({
    'chainId' : 3,
    'gas' : 210000,
    'gasPrice' : w3.toWei('50', 'gwei'),
    'nonce' : nonce,
})

#the next transaction builds the transaction for retrieving the information for a component token- by using the getbuildignItem function-
#question: how to trigger the struct function?
receipts = []
nonce = w3.eth.getTransactionCount(wallet_address)
tx_dict = smartContract.functions.getbuildingItem(message).buildTransaction({
    'chainId' : 3,
    'gas' : 210000,
    'gasPrice' : w3.toWei('50', 'gwei'),
    'nonce' : nonce,
})

#the next transaction builds the transaction for purchasing a buildingItem token- by using the purchasebuildingItem function-
#question: how to trigger the struct function?
receipts = []
nonce = w3.eth.getTransactionCount(wallet_address)
tx_dict = smartContract.functions.purchasebuildingItem(message).buildTransaction({
    'chainId' : 3,
    'gas' : 210000,
    'gasPrice' : w3.toWei('50', 'gwei'),
    'nonce' : nonce,
})





#the next attempts to send, and issue a receipt for the transaction.
signed_tx = w3.eth.account.sign_transaction(tx_dict, wallet_private_key)
tx_hash = w3.eth.sendRawTransaction(signed_tx.rawTransaction)
tx_receipt = w3.eth.waitForTransactionReceipt(tx_hash, timeout=120, poll_latency=0.1)
receipts.append(tx_receipt)

#check the CAADRIA paper for the rest of the code ?
#read the issued minted component token and re-issue it inside Dynamo. maybe this needs to be a different nodee


#this sets a numbe on the blockchain.
nonce = w3.eth.getTransactionCount(wallet_address)
tx_dict = smartContract.functions.setMyUint(number).buildTransaction({
    'chainId' : 3,
    'gas' : 210000,
    'gasPrice' : w3.toWei('50', 'gwei'),
    'nonce' : nonce,
})

#the next attempts to send, and issue a receipt for the transaction.
signed_tx = w3.eth.account.sign_transaction(tx_dict, wallet_private_key)
tx_hash = w3.eth.sendRawTransaction(signed_tx.rawTransaction)
tx_receipt = w3.eth.waitForTransactionReceipt(tx_hash, timeout=120, poll_latency=0.1)

receipts.append(tx_receipt)


#see if you can read these though infura or through the Alcheemy service (alchemyapi.io)
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
OUT = outputList
