<template>
    <div>
      <h2>Parent Component</h2>
      <!-- <slotchild/> -->
      <Slotchild>
        <!-- Injecting custom content into named slots -->
        <template v-slot:header>
          <h1>This is a Custom Header</h1>
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
  
  export default {
    components: {
        Slotchild
      
    }
  };
  </script>
  