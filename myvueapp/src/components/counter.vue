<template>
    <h1>{{ count }}</h1>
    <button v-on:click="count = count + 1">+</button>
    <button v-on:click="count = count - 1">-</button>

</template>

<script>
export default {
    name: "counter",
    data() {
        return {
            count: 0, // Changed ; to ,
        };
    },
    watch: {
        count(val, prev) {
            if (val > 5 && val > prev) {
                alert("stop counting")
            }
        }
    }
}
</script>
