<template>
    <div class="container">
      <h2>Parent Component</h2>
      <!-- <slotchild/> -->
      <Slotchild>
        <!-- Injecting custom content into named slots -->
        <template v-slot:header="slotProps">
          <h1>This is a Custom Header {{ slotProps.email }}</h1>
        </template>
        <template v-slot:content>
          <p>This is Custom Content</p>
        </template>
        <template v-slot:footer>
          <h1>This is a Custom Footer</h1>
        </template>
      </Slotchild>
    </div>
  </template>
  
  <script>
import Slotchild from './slotchild.vue';
import card from './card.vue';
  
  export default {
    components: {
        Slotchild,
        card
      
    }
  };
  </script>
  
  <style scoped>
  .container{
    margin-top: 90px;
  }
</style>