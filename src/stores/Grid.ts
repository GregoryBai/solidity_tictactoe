import { writable } from 'svelte/store'

export const Grid = writable(
    new Array(3).fill(0).map(() => new Array(3).fill(0))
)
