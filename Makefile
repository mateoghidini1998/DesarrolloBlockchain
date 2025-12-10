.PHONY: build test deploy-sepolia

build:
	forge build

test:
	forge test -vvv

deploy-sepolia:
	forge script script/Deploy.s.sol:Deploy --rpc-url $$SEPOLIA_RPC_URL --broadcast --verify -vvvv


