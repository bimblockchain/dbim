import requests
import json

files ={
'topology_string': ('CASCADE Topology V1, (c) Matra-Datavision Locations 0 Curve2ds 0 Curves 0 Polygon3D 0 PolygonOnTriangulations 0 Surfaces 0 Triangulations 0 TShapes 1 Ve 1e-07 10 20 30 0 0 0101101 * +1 0 '),
}

responce = requests.post('https://ipfs.infura.io:5001/api/v0/add', files=files)
p = responce.json()
hash = p['Hash']
print(hash)
