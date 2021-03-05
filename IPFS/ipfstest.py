import ipfshttpclient
#test this on Linux
if __name__ == '__main__':
# Connect to local node
    try:
        api = ipfshttpclient.connect('127.0.0.1', 5001)
        print(api)
    except ipfshttpclient.exceptions.ConnectionError as ce:
        print(str(ce))
