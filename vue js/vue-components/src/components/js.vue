

<template>
    <div class="one-container">
        <button @click="tab='variable'">variable in js</button>
        <button @click="tab='loop'">loops in js</button>
        <component :is="tab"/>

        <!-- <p>JavaScript is a versatile programming language used for both client-side and server-side development. It is the language of the web and is essential for building interactive and dynamic web applications. JavaScript frameworks like React, Vue.js, and AngularJS have revolutionized web development. Its asynchronous nature and event-driven architecture make it suitable for building responsive web applications. Mastering JavaScript is crucial for modern web developers to create engaging user experiences.</p> -->
    </div>
</template>

<script >
import variable from './variable.vue'
import loop from './loop.vue'


export default{
  components: { variable,loop },
  data(){
    return{
      tab:'loop'
    }
  },
    
}

</script>

<style scoped>
.one-container{
  margin-top: 20px;
}
button {
  margin-right: 20px; 
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 10px;
  transition-duration: 0.4s;
  cursor: pointer;
  border-radius: 5px;
}
button:hover {
  background-color: #bfd3c0; /* Darker green */
}
</style>