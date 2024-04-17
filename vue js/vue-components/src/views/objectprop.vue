<template>
    <div>
    <ul>
        <li v-for="(value, key, index) in myObject" :key="index">
            {{index}} - {{key}} : {{value}}
        </li>
    </ul>
</div>
</template>

<script>
export default {
    name: "objectprop",
    props:{
        myObject:{
            type:Object,
            required:false
        }
    }
}
</script>

<style scoped>

</style>