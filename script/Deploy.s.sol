// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import {BUSD} from "../src/BUSD.sol";
import {CCNFT} from "../src/CCNFT.sol";

contract Deploy is Script {
    function run() external {
        uint256 pk = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(pk);
        BUSD busd = new BUSD();
        CCNFT ccnft = new CCNFT();
        vm.stopBroadcast();

        console2.log("BUSD:", address(busd));
        console2.log("CCNFT:", address(ccnft));
    }
}


