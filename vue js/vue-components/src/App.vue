<!-- App.vue -->

<template>
  <br>
   <nav>
      <router-link to="/">Home</router-link> <!-- Link to home page -->
      <router-link to="/">Home</router-link> <!-- Link to home page -->

    </nav>
    <br><br>
    <slotparent/>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Slotparent from './components/slotparent.vue'
import home from './views/home.vue'


export default {
  name: 'App',
  components: {
    home,
    Slotparent
   
},

}
</script>


<style scoped>
.nav .router-link {
  margin-right: 50px;
}
</style>
