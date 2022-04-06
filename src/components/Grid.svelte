<style>
    .grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-auto-rows: auto;
        grid-gap: 5px;
    }
</style>

<script lang="ts">
    import Cell from './Cell.svelte'
    import { Grid } from '../stores/Grid'
</script>

<div class="grid">
    {#each $Grid as row, y}
        {#each row as column, x}
            <Cell x="{x}" y="{y}" on:cell-click />
        {/each}
    {/each}
</div>
