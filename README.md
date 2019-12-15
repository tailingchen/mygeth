# mygeth

## Build geth image
```
$ docker build -t geth:latest .
```
## Genesis for private chain
```
{
  "config": {
    "chainId": 1215,
    "homesteadBlock": 1,
    "eip150Block": 2,
    "eip150Hash": "0x0000000000000000000000000000000000000000000000000000000000000000",
    "eip155Block": 3,
    "eip158Block": 3,
    "byzantiumBlock": 4,
    "constantinopleBlock": 5,
    "clique": {
      "period": 5,
      "epoch": 30000
    }
  },
  "nonce": "0x0",
  "timestamp": "0x5df59d04",
  "extraData": "0x0000000000000000000000000000000000000000000000000000000000000000a77868fd179c0ec19a33e2b3237d7b63063af7d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  "gasLimit": "0x47b760",
  "difficulty": "0x1",
  "mixHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "coinbase": "0x0000000000000000000000000000000000000000",
  "alloc": {
    "e7277c832ea9b357ffba6fdb65b3ad74c92802ef": {
      "balance": "0x200000000000000000000000000000000000000000000000000000000000000"
    }
  },
  "number": "0x0",
  "gasUsed": "0x0",
  "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000"
}
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

## Send transaction
```
> var tx = {from: "0xE7277C832Ea9b357fFba6fDB65b3ad74c92802Ef", to: "0xa77868fd179c0eC19A33E2b3237d7b63063af7D0", value: web3.toWei(1.23, "ether"), gas:21000, gasPrice: web3.toWei(10, "gwei")};
undefined

> personal.sendTransaction(tx, "")
0xb912acdbad630c028d9a6a9af4cdfe05bf06fa079533ad1a525c78219bfd31e4

> eth.getTransaction("0xb912acdbad630c028d9a6a9af4cdfe05bf06fa079533ad1a525c78219bfd31e4")
{
  blockHash: "0x244f3e86f49e848402e36a2db3e29e3ee4ac744cbe611cad668e52eff1593298",
  blockNumber: 56,
  from: "0xe7277c832ea9b357ffba6fdb65b3ad74c92802ef",
  gas: 21000,
  gasPrice: 10000000000,
  hash: "0xb912acdbad630c028d9a6a9af4cdfe05bf06fa079533ad1a525c78219bfd31e4",
  input: "0x",
  nonce: 0,
  r: "0x1a84e1205b6f136e2a27428f482f3cb793f4e74c22d5b7585342e7601d1d2b09",
  s: "0x556983d6f3d8f6e796444cb7a74b2325ebf99757233a28b019f4ac7346ce7305",
  to: "0xa77868fd179c0ec19a33e2b3237d7b63063af7d0",
  transactionIndex: 0,
  v: "0x9a2",
  value: 1230000000000000000
}
```
