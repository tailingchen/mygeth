#!/bin/bash

PWD=$(pwd)

CHAINDATA="$PWD/data"
GENESIS="$PWD/eth/genesis.json"
KEYSTORE="$PWD/eth/keystore-miner"
NODEKEY="$PWD/eth/nodekey"
PASSWORD="$PWD/eth/password.txt"

if [ ! -d $CHAINDATA ]; then
  mkdir -p $CHAINDATA;
fi

# Init genesis
docker run \
  -v $CHAINDATA:"/data" \
  -v $GENESIS:"/data/genesis.json" \
  geth:latest \
  --datadir "/data" \
  init "/data/genesis.json"

# Run miner
docker run \
  -v $CHAINDATA:"/data" \
  -v $GENESIS:"/data/genesis.json" \
  -v $KEYSTORE:"/data/keystore" \
  -v $NODEKEY:"/data/geth/nodekey" \
  -v $PASSWORD:"/data/password.txt" \
  --network host \
  geth:latest \
  --datadir "/data" \
  --keystore "/data/keystore" \
  --port 30303 \
  --ws \
  --wsapi "eth,txpool,personal,debug" \
  --wsaddr "0.0.0.0" \
  --wsport 8546 \
  --wsorigins "*" \
  --nodiscover \
  --nodekey "/data/geth/nodekey" \
  --etherbase "0xa77868fd179c0eC19A33E2b3237d7b63063af7D0" \
  --unlock "0xa77868fd179c0eC19A33E2b3237d7b63063af7D0" \
  --password "/data/password.txt" \
  --allow-insecure-unlock \
  --mine
