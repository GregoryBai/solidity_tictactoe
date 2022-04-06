<style>
    .root {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }
</style>

<script lang="ts">
    import Grid from './components/Grid.svelte'
    import { Center } from './layouts'
    import { Contract, ethers, providers } from 'ethers'
    import TicTacToe from './artifacts/contracts/TicTacToe.sol/TicTacToe.json'
    import { Grid as GridStore } from './stores/Grid'

    // // export const contractAddress = '0x5fbdb2315678afecb367f032d93f642f64180aa3'
    // export const contractAddress = '0x5FC8d32690cc91D4c39d9d3abcBD16989F875707'

    // const requestConnectAccount = async () => {
    //     const [acc] = await window.ethereum.request({
    //         method: 'eth_requestAccounts',
    //     })
    // }

    // const makeCall = async () => {
    //     const provider = new ethers.providers.Web3Provider(window.ethereum)
    //     const signer = provider.getSigner()
    //     const contract = new ethers.Contract(
    //         contractAddress,
    //         TicTacToe.abi,
    //         signer
    //     )

    //     const tx = await signer.sendTransaction({
    //         to: contractAddress,
    //         value: ethers.utils.parseEther('0.5'),
    //     })

    //     console.log(tx)

    //     await tx.wait()
    // }

    // const sub = async () => {
    //     const provider = new ethers.providers.Web3Provider(window.ethereum)
    //     const contract = new ethers.Contract(
    //         contractAddress,
    //         TicTacToe.abi,
    //         provider
    //     )

    //     // contract.on('Transfer', (...args) => {
    //     //     console.log(args)
    //     // })

    //     contract.on('NewTurn', (...args) => {
    //         console.log(args)
    //     })

    //     contract.on('TurnCompleted', (...args) => {
    //         console.log(args)
    //     })

    //     contract.on('GameCompleted', (...args) => {
    //         console.log(args)
    //     })

    //     // contract.on('Transfer', (...args) => {
    //     //     console.log(args)
    //     // })

    //     contract.queryFilter({}).then((res) => console.log(res))
    // }

    // const checkEvents = () => {
    //     const provider = new ethers.providers.Web3Provider(window.ethereum)
    //     const contract = new ethers.Contract(
    //         contractAddress,
    //         TicTacToe.abi,
    //         provider
    //     )

    //     contract.queryFilter({}).then((res) => console.log(res))
    // }

    const completeTurn = () => {}

    // const completeTurn = async ({ x, y }) => {
    //     const provider = new ethers.providers.Web3Provider(window.ethereum)
    //     const signer = provider.getSigner()
    //     const contract = new ethers.Contract(
    //         contractAddress,
    //         TicTacToe.abi,
    //         signer
    //     )

    //     const tx = await contract.completeTurn(y, x)
    //     console.log(tx)
    //     const OK = await tx.wait()
    //     console.log(OK)

    //     if (OK) {
    //         // GridStore.update(prev => prev.map(row => row == x ? row.map(col => col == y) : row) )
    //     }
    // }

    // if (window.ethereum !== 'undefined') {
    //     // load()
    // } else {
    //     console.log('Your browser does not support Web3!')
    // }
</script>

<main class="root">
    <!-- <button on:click="{checkEvents}">check</button>
    <button on:click="{sub}">Subscribe</button>
    <button on:click="{requestConnectAccount}">Login</button>
    <button on:click="{makeCall}">Call</button> -->
    <Center>
        <Grid on:cell-click="{(e) => completeTurn(e.detail)}" />
    </Center>
</main>
