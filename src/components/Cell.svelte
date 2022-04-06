<style lang="scss">
    .cell {
        width: 15vmin;
        height: 15vmin;
        border: 1px solid black;

        display: flex;
        justify-content: center;
        align-items: center;
        transition: all ease-in 50ms;

        &:hover {
            font-size: 2em;
        }

        &.X {
            background: black;
            color: whitesmoke;
        }

        &.O {
            background: salmon;
        }
    }
</style>

<script lang="ts">
    export let x
    export let y

    import { createEventDispatcher } from 'svelte'

    const dispatch = createEventDispatcher()
    // ? class?
</script>

<div class="{`cell ${x}`}" on:click="{(e) => dispatch('cell-click', { x, y })}">
    {y}-{x}
</div>
