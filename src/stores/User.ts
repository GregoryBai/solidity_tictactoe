import { writable } from 'svelte/store'

type User = {
    account: 0
}

const User = writable<number>()
