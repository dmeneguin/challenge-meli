import requests
import csv
from dotenv import load_dotenv
import os
import asyncio
from aiohttp import ClientSession
from math import ceil

load_dotenv()

#https://auth.mercadolivre.com.br/authorization?response_type=code&client_id=8816086626352747&state=ABC123&redirect_uri=https://www.google.com

AUTH_CODE=os.getenv('AUTH_CODE')
CLIENT_ID=os.getenv('CLIENT_ID')
CLIENT_SECRET=os.getenv('CLIENT_SECRET')
MELI_API_OAUTH=os.getenv('MELI_API_OAUTH')
MELI_API_SEARCH=os.getenv('MELI_API_SEARCH')
MELI_API_ITEMS=os.getenv('MELI_API_ITEMS')
REDIRECT_URI=os.getenv('REDIRECT_URI')
SEARCH_LIMIT = 50

token = "APP_USR-8816086626352747-032018-11197341113bebaa78bfb68ad09d73a6-127145884"

def make_http_request(method, url, params={}, headers={}):
    if method == 'GET':
        response = requests.get(url, params=params, headers=headers)
        assert response.status_code == 200, f"GET {url} response status should be 200 but it is {response.status_code}. Response message: {response.text}"
        response_json = response.json()
    else:
        response = requests.post(url, data=params, headers=headers)
        assert response.status_code == 200, f"POST {url} response status should be 200 but it is {response.status_code}. Response message: {response.text}"
        response_json = response.json()        
    return response_json

async def async_http_get(url, headers):
    async with ClientSession(headers=headers) as session:
        async with session.get(url) as response:
            result = await response.json()
            return result

async def fetch_products_details(all_products, headers):
    tasks = []
    for p in all_products:
        tasks.append(asyncio.create_task(async_http_get(f"{MELI_API_ITEMS}{p['id']}", headers)))
    
    return await asyncio.gather(*tasks)

def get_token():
    payload = {
        "accept": "application/json",
        "content-type": "application/x-www-form-urlencoded",
        "grant_type":"authorization_code",
        "client_id": CLIENT_ID,
        "client_secret": CLIENT_SECRET,
        "code": AUTH_CODE,
        "redirect_uri": REDIRECT_URI
    }
    response_json = make_http_request("POST", MELI_API_OAUTH, params=payload)
    token = response_json['access_token']
    return token

def product_search(product_name, headers):
    params = {
        "q":product_name,
        "limit":"50"
    }

    response_json = make_http_request("GET", MELI_API_SEARCH, params, headers)
    num_iterations = ceil(response_json['paging']['total']/SEARCH_LIMIT) - 1
    all_products = response_json['results']
    params['offset'] = 0

    for i in range(num_iterations):
        params['offset'] = SEARCH_LIMIT * (i+1)
        response_json = make_http_request("GET", MELI_API_SEARCH, params, headers)
        results = response_json['results']
        all_products.extend(results)
    return all_products

def write_to_csv(filename, header, rows):
    with open(filename, 'w', newline='') as csvfile:
        filewriter = csv.writer(csvfile, delimiter=';', quotechar='|', quoting=csv.QUOTE_MINIMAL)
        filewriter.writerow(header)
        filewriter.writerows(rows)

try:
    if token == "":
        token = get_token()
        print(token)

    headers = {
        "Authorization": f"Bearer {token}"
    }

    all_products = product_search("chromecast", headers)
    all_products.extend(product_search("amazon fire tv", headers))
    all_products.extend(product_search("roku", headers))

    print(len(all_products))

    products_details = asyncio.run(fetch_products_details(all_products, headers))

    rows = []
    for p in products_details:
        rows.append([
            p['price'],
            p['title'],
            p['category_id'],
            p['base_price'],
            p['initial_quantity'],
            p['condition'],
            p['date_created'],
            p['seller_address']['city']['name'],
            p['seller_address']['state']['name'],
            p['seller_address']['country']['name']
        ])

    header = ['price','title','category_id','base_price','initial_quantity','condition','date_created','city','state','country']
    write_to_csv('products.csv', header, rows)

except AssertionError as a:
    print(f"Error: {a}")
