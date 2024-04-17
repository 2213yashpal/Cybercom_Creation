<template>
    <div>
      <p>Current count: {{ count }}</p>
      <button @click="increment">Increment</button>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        count: 0
      };
    },
    watch: {
      count: {
        handler(newValue, oldValue) {
          console.log(`Count changed from ${oldValue} to ${newValue}`);
        },
        deep: true,
        immediate: true
      }
    },
    methods: {
      increment() {
        this.count++;
      }
    }
  };
  </script>
  