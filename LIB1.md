# LIB 1

## Build geth image
```
$ docker build -t geth:latest go-ethereum
```
## Run a miner on private chain
```
$ ./run-miner.sh
```

## Run a node on private chain and peering with miner
```
$ ./run-node.sh
```

## Attach node console
```
$ docker run -it --network host geth:latest attach "ws://127.0.0.1:8547"
```

## Send transaction with sender 0xE7277C832Ea9b357fFba6fDB65b3ad74c92802Ef
```
> var tx = {from: "0xE7277C832Ea9b357fFba6fDB65b3ad74c92802Ef", to: "0xa77868fd179c0eC19A33E2b3237d7b63063af7D0", value: web3.toWei(1.23, "ether"), gas:21000, gasPrice: web3.toWei(10, "gwei")};
undefined

> personal.sendTransaction(tx, "")
0x6c0c580a785c7cedd8671168e86828233cfc17589b2381998a4e45cc4f85b387

> eth.getTransaction("0x6c0c580a785c7cedd8671168e86828233cfc17589b2381998a4e45cc4f85b387")
null
```

## Reject log
```
WARN [12-15|05:43:08.379] Reject tx                                hash=0x6c0c580a785c7cedd8671168e86828233cfc17589b2381998a4e45cc4f85b387 from=0xE7277C832Ea9b357fFba6fDB65b3ad74c92802Ef
```
