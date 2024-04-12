<template>
    <h1>{{ data.name }}</h1>
</template>

<script>
export default{
    name: "user",
    props:{
        data:Object
    }
}
</script>