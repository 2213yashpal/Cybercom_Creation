<template>
    <div>
      <p>Value received from parent: {{ childValue }}</p>
    </div>
  </template>
  
  <script setup>
  import { defineModel } from 'vue';
  
  const childValue = defineModel('childValue');
  </script>
  