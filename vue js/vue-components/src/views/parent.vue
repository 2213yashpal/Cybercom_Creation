<template>
    <div>
      <label for="inputField">Enter your name:</label>
      <input id="inputField" type="text" v-model="parentValue" />
      <br />
      <Child v-model:childValue="parentValue" />
    </div>
  </template>
  
  <script setup>
  import { defineModel } from 'vue';
  import Child from './child.vue'
  
  const parentValue = defineModel('parentValue');
  </script>
  