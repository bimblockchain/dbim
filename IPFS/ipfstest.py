import ipfshttpclient
#test this on Linux
if __name__ == '__main__':
# Connect to local node
    try:
        #client = ipfshttpclient.connect()
        api = ipfshttpclient.connect('/ip4/0.0.0.0/tcp/5001')
        print(api)
    except ipfshttpclient.exceptions.ConnectionError as ce:
        print(str(ce))
