<template>
    <div>
      <h5 v-if="showGreeting">Hello, Vue.js!</h5>
      <h1 v-else>Goodbye, Vue.js!</h1>
  
      <h2>Rendering a list:</h2>
      <ul>
        <li v-for="(item, index) in itemList" :key="index">
          Item {{ index + 1 }}: {{ item }}
        </li>
      </ul>
  
      <h2>Conditional list rendering:</h2>
      <ul v-if="showSecondList">
        <li v-for="(item, index) in secondItemList" :key="index">
          Item {{ index + 1 }}: {{ item }}
        </li>
      </ul>
      <p v-else>No second list to show.</p>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        showGreeting: true,
        itemList: ['Apple', 'Banana', 'Orange', 'Mango'],
        showSecondList: true,
        secondItemList: ['Cat', 'Dog', 'Bird']
      };
    }
  };
  </script>
  