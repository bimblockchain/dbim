import ipfsapi
#test this on Linux
if __name__ == '__main__':
# Connect to local node
    try:
        api = ipfsapi.connect('127.0.0.1', 5001)
        print(api)
    except ipfsapi.exceptions.ConnectionError as ce:
        print(str(ce))
