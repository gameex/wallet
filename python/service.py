#!/usr/bin/env python
import os,time,random
import requests

def req(url):
    print url
    try:
        response = requests.get(url)
        #print(response.text) 
    except requests.RequestException as e:
        print e

def reqall():
    host = "http://wallet-admin.honorsql.com/"
    member = [
        '/api/wallet/Cron/index',
        '/api/wallet/rpc_fetch/index/coin_symbol/BTC',
        '/api/wallet/rpc_fetch/index/coin_symbol/ETH',
        '/api/wallet/rpc_fetch/index/coin_symbol/USDT',
        '/api/wallet/rpc_fetch/index/coin_symbol/BCH',
        '/api/wallet/rpc_fetch/index/coin_symbol/LTC',
        '/api/wallet/rpc_fetch/index/coin_symbol/ETC',
        '/api/wallet/rpc_fetch/index/coin_symbol/XRP',
        '/api/wallet/rpc_fetch/index/coin_symbol/EOS',
        '/api/wallet/rpc_transfer',
    ]
    for each in member:
        req(host+each)
while True:
        reqall()
        time.sleep(1)
