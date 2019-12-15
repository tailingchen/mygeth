#!/bin/bash

PWD=$(pwd)

CHAINDATA="$PWD/nodedata"
GENESIS="$PWD/eth/genesis.json"
KEYSTORE="$PWD/eth/keystore-node"
STATICNODES="$PWD/eth/static-nodes.json"

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
  -v $STATICNODES:"/data/geth/static-nodes.json" \
  --network host \
  geth:latest \
  --datadir "/data" \
  --keystore "/data/keystore" \
  --port 30304 \
  --ws \
  --wsapi "eth,txpool,personal,debug" \
  --wsaddr "0.0.0.0" \
  --wsport 8547 \
  --wsorigins "*" \
  --nodiscover
