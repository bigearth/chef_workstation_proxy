# Big Earth Blockchain Bitcoin Cookbook

This cookbook downloads, installs and configures Bitcoin as a full node. It conditionally builds out one of 3 'flavors' of bitcoin:

1. Core 
2. XT
3. Classic

## Requirements

## Usage

### `bitcoin::bitcoin_core` recipe

Downloads the official release from https://github.com/bitcoin/bitcoin/releases and compiles it along with an init.d service script.

### `bitcoin::bitcoin_xt` recipe

Downloads the official release from https://github.com/bitcoinxt/bitcoinxt/archive/master.zip and compiles it along with an init.d service script.

### `bitcoin::bitcoin_classic` recipe

Downloads the official release from "https://github.com/bitcoinclassic/bitcoinclassic/archive/0.11.2.zip and compiles it along with an init.d service script.

## License

GPLv2
