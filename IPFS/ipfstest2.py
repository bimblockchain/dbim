import ipfshttpclient

if __name__ == '__main__':

    try:
    #client = ipfshttpclient.connect()
        api = ipfshttpclient.connect('/ip4/0.0.0.0/tcp/5001')
        print(api)
    except ipfshttpclient.exceptions.ConnectionError as ce:
        print(str(ce))

        client.add('/home/arlav/Github/dbim/IPFS/setecastronomy.blend')
        p = responce.json()
        hash = p['Hash']
        print(hash)
