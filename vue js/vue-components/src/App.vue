<!-- App.vue -->

<template>
      <navbar/>

  <div class="container">
    <router-view></router-view>
  </div>
</template>

<script>

import navbar from './components/navbar.vue';


export default {
  name: 'App',
  components: {
  
    navbar
   
},

}
</script>


<style>
.container{
  margin-top: 90x;
}

</style>
