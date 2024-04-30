<script>
import java from './java.vue'
import js from './js.vue'
import php from './php.vue'

export default {
    components: {
        java, js, php,
    },
    data() {
        return {
            tab: 'java'

        }
    },

    methods: {

    },
}

</script>

<template>
    <div class="container">
        <h1>dynamic components</h1>

        <button @click="tab = 'java'">load java</button>
        <button @click="tab = 'php'">load php</button>
        <button @click="tab = 'js'">load js</button>

        <keep-alive  class="tab-content">
            <component :is="tab" />
        </keep-alive>

      

    </div>

</template>

<style scoped>
.container {
    margin-top: 90px;
    text-align: center;
}

.tab-content {
    border: 1px solid #ccc;
    padding: 20px;
    margin-top: 20px;
    width: 100%;
}

button {
    margin-right: 20px;
    background-color: #4CAF50;
    /* Green */
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    /* margin: 4px 10px; */
    transition-duration: 0.4s;
    cursor: pointer;
    border-radius: 5px;
}

button:hover {
    background-color: #bfd3c0;
    /* Darker green */
}
</style>