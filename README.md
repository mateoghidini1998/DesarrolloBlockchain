## INDICACIONES - PROYECTO FINAL

### 1- Inicialización de un nuevo proyecto con foundry

### 2- Configuración necesaria del archivo foundry.toml y variables de entorno

### 3- Instalación de contratos de Open Zeppelin

```shell
$ forge install OpenZeppelin/openzeppelin-contracts@v4.5.0 --no-commit
```

### 4- Desarrollo del contrato CCNFT

### 5- Desarrollo del contrato de testeo y scripts de despliegue

### 6- Compilación del proyecto.

### 7- Configuración de archivo Makefile

### 7- Despliegue y verificación de contratos mediante scripts de despliegue/verificación

### 8- Importación de Tokens BUSD (ERC20) en billetera de Metamask mediante dirección del contrato BUSD desplegado.

## 9- Interacción con la funcion "buy"

### Set de todas las funciones que condicionan a la funcion buy

### 10- Aprobacion del contrato CCNFT

```shell
###  Opción posible: Utilizar remix para compilar el contrato BUSD. Una vez compilado, en la pestañña de Despliegue:
$ Agregar direccion del contrato "BUSD" para poder interactuar con él: At Address "Direcciṕn del contrato BUSD"
$ approve el contrato CCNFT: spender: "Dirección del contrato CCNFT"      value: 10000000000000000000000000 ( el total de _mint(msg.sender, 10000000 * 10 ** 18))
```

### 11- Dentro del contrato CCNFT en Etherscan

```shell
###  seteamos las funciones necesarias (condicionantes) para poder relizar el "buy"
$ SetFeesCollector
$ SetFundsCollector
$ setFundsToken
```

### 12- Ejecución de la funcion buy

## ADJUNTAR EL ENLACE DE SEPOLIA ETHERSCAN DE LA DIRECCION DEL CONTRATO DESPLEGADO JUNTO A TODAS LAS INTERACCIONES REALIZADAS INCLUIDA LA COMPRA DEL NFT (BUY).

## ADJUNTAR UNA CAPTURA DE PANTALLA DEL NFT "CCNFT" Y LOS TOKENS ERC20 "BUSD" IMPORTADOS A METAMASK.

## COMPARTIR EL ENLACE DE GITHUB QUE CONTIENE EL PROYECTO COMPLETO.

### Guía rápida de uso (Foundry)

```shell
# Instalar dependencias
forge install OpenZeppelin/openzeppelin-contracts@v4.5.0 --no-commit
forge install foundry-rs/forge-std@v1.7.6 --no-commit

# Compilar y testear
forge build
forge test -vvv

# Desplegar en Sepolia (requiere .env con SEPOLIA_RPC_URL, PRIVATE_KEY, ETHERSCAN_API_KEY)
forge script script/Deploy.s.sol:Deploy --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
```

Una vez desplegado:
- En el contrato `CCNFT` setear: `setFundsToken(BUSD)`, `setFundsCollector(...)`, `setFeesCollector(...)`, `setMaxValueToRaise(...)`, `addValidValues(precio)`, `setMaxBatchCount(...)`, `setBuyFee(...)`, `setTradeFee(...)`, `setProfitToPay(...)`, `setCanBuy(true)`, `setCanClaim(true)`, `setCanTrade(true)`.
- En `BUSD`, aprobar al contrato `CCNFT` por un monto suficiente con `approve(CCNFT, amount)`.
- Ejecutar la compra: `buy(value, amount)` donde:
  - `value` es uno de los valores válidos agregados con `addValidValues`.
  - `amount` es la cantidad de NFTs a mintear (≤ `maxBatchCount`).
# DesarrolloBlockchain
