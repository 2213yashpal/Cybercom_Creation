<!-- excompo.vue -->

<template>
    <div>
      <p v-bind="$attrs">Message: {{ message }}</p>
      <p>Age: {{ age }}</p>
    </div>
  </template>
  
  <script>
  export default {
    name: 'Excompo', 
    inheritAttrs: false,
    props:{
        message: {
            type: String,
            default: 'Hello',
            required: true

        },
        age: {
            type: Number,
            required: true
        },  

    }
    
  };
  </script>
  
  <style>
  /* Styles for the component */
  </style>
  