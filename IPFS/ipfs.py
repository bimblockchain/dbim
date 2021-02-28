import requests
import json

files ={
'file': ('Too Many Secrets'),
}

responce = requests.post('https://ipfs.infura.io:5001/api/v0/add', files=files)
p = responce.json()
hash = p['Hash']
print(hash)
