<template>
    <div>
      <h2>DOM Interaction with ref</h2>
      <div ref="myDiv" style="width: 200px; height: 100px; background-color: lightblue;"></div><br/>
      <button @click="changeColor">Change Color</button><br/><br/>
      <p>{{ count }}</p>
      <button @click="increment">Increment</button>

    </div>
  </template>
  
  <script>
  import { ref } from 'vue';
  
  export default {
    setup() {
      const myDiv = ref(null);
      const count = ref(0);
  
      const changeColor = () => {
        if (myDiv.value) {
          myDiv.value.style.backgroundColor = getRandomColor();
        }
      };
  
      const getRandomColor = () => {
        const letters = '0123456789ABCDEF';
        let color = '#';
        for (let i = 0; i < 6; i++) {
          color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
      };
  
      function increment() {
        count.value++;
      }
  
      return {
        myDiv,
        count,
        changeColor,
        increment
      };
    }
  }
  </script>
  