// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {BUSD} from "../src/BUSD.sol";
import {CCNFT} from "../src/CCNFT.sol";

// Definición del contrato de prueba CCNFTTest que hereda de Test. 
// Declaración de direcciones y dos instancias de contratos (BUSD y CCNFT).
contract CCNFTTest is Test {
    address deployer;
    address c1;
    address c2;
    address funds;
    address fees;
    BUSD busd;
    CCNFT ccnft;

// Ejecución antes de cada prueba. 
// Inicializar las direcciones y desplgar las instancias de BUSD y CCNFT.
    function setUp() public {
        deployer = address(this);
        c1 = makeAddr("c1");
        c2 = makeAddr("c2");
        funds = makeAddr("funds");
        fees = makeAddr("fees");
        busd = new BUSD();
        ccnft = new CCNFT();
    }

// Prueba de "setFundsCollector" del contrato CCNFT. 
// Llamar al método y despues verificar que el valor se haya establecido correctamente.
    function testSetFundsCollector() public {
        ccnft.setFundsCollector(funds);
        assertEq(ccnft.fundsCollector(), funds);
    }

// Prueba de "setFeesCollector" del contrato CCNFT
// Verificar que el valor se haya establecido correctamente.
    function testSetFeesCollector() public {
        ccnft.setFeesCollector(fees);
        assertEq(ccnft.feesCollector(), fees);
    }

// Prueba de "setProfitToPay" del contrato CCNFT
// Verificar que el valor se haya establecido correctamente.
    function testSetProfitToPay() public {
        ccnft.setProfitToPay(500);
        assertEq(ccnft.profitToPay(), 500);
    }

// Prueba de "setCanBuy" primero estableciéndolo en true y verificando que se establezca correctamente.
// Despues establecerlo en false verificando nuevamente.
    function testSetCanBuy() public {
        ccnft.setCanBuy(true);
        assertTrue(ccnft.canBuy());
        ccnft.setCanBuy(false);
        assertFalse(ccnft.canBuy());
    }

// Prueba de método "setCanTrade". Similar a "testSetCanBuy".
    function testSetCanTrade() public {
        ccnft.setCanTrade(true);
        assertTrue(ccnft.canTrade());
        ccnft.setCanTrade(false);
        assertFalse(ccnft.canTrade());
    }

// Prueba de método "setCanClaim". Similar a "testSetCanBuy".
    function testSetCanClaim() public {
        ccnft.setCanClaim(true);
        assertTrue(ccnft.canClaim());
        ccnft.setCanClaim(false);
        assertFalse(ccnft.canClaim());
    }

// Prueba de "setMaxValueToRaise" con diferentes valores.
// Verifica que se establezcan correctamente.
    function testSetMaxValueToRaise() public {
        ccnft.setMaxValueToRaise(1_000 ether);
        assertEq(ccnft.maxValueToRaise(), 1_000 ether);
        ccnft.setMaxValueToRaise(2_000 ether);
        assertEq(ccnft.maxValueToRaise(), 2_000 ether);
    }

// Prueba de "addValidValues" añadiendo diferentes valores.
// Verificar que se hayan añadido correctamente.
    function testAddValidValues() public {
        uint256 v1 = 100 ether;
        uint256 v2 = 200 ether;
        ccnft.addValidValues(v1);
        ccnft.addValidValues(v2);
        assertTrue(ccnft.validValues(v1));
        assertTrue(ccnft.validValues(v2));
    }

// Prueba de "setMaxBatchCount".
// Verifica que el valor se haya establecido correctamente.
    function testSetMaxBatchCount() public {
        ccnft.setMaxBatchCount(25);
        assertEq(ccnft.maxBatchCount(), 25);
    }

// Prueba de "setBuyFee".
// Verificar que el valor se haya establecido correctamente.
    function testSetBuyFee() public {
        ccnft.setBuyFee(100);
        assertEq(ccnft.buyFee(), 100);
    }

// Prueba de "setTradeFee".
// Verificar que el valor se haya establecido correctamente.
    function testSetTradeFee() public {
        ccnft.setTradeFee(250);
        assertEq(ccnft.tradeFee(), 250);
    }

// Prueba de que no se pueda comerciar cuando canTrade es false.
// Verificar que se lance un error esperado.
    function testCannotTradeWhenCanTradeIsFalse() public {
        vm.expectRevert(bytes("Trade disabled"));
        ccnft.trade(1);
    }

// Prueba que no se pueda comerciar con un token que no existe, incluso si canTrade es true. 
// Verificar que se lance un error esperado.
    function testCannotTradeWhenTokenDoesNotExist() public {
        ccnft.setCanTrade(true);
        vm.expectRevert(bytes("Token !exists"));
        ccnft.trade(999);
    }
}
