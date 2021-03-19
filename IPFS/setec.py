import requests
import json

files ={
'/Users/arlav/Documents/Github/dbim/IPFS/setecastronomy.blend'
}

responce = requests.post('https://ipfs.infura.io:5001/api/v0/add' \
    -F file='/Users/arlav/Documents/Github/dbim/IPFS/setecastronomy.blend')
p = responce.json()
hash = p['Hash']
print(hash)
