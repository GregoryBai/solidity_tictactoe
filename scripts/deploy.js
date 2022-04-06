const hre = require('hardhat')
const ethers = hre.ethers

async function main() {
    const [signer] = await ethers.getSigners()
    console.log(`The signer is: ${signer.getAddress()}`)

    const TicTacToe = await hre.ethers.getContractFactory('TicTacToe', signer)
    const ttt = await TicTacToe.deploy()

    await ttt.deployed()

    console.log('TicTacToe deployed at:', ttt.address)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })
