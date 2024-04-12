<template>
  <div>
    <!-- Navbar -->
    <nav class="navbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <router-link to="/" class="nav-link">Home</router-link>
        </li>
        <li class="nav-item">
          <router-link to="/pracbind" class="nav-link">Practice of Binding</router-link>
        </li>
        <li class="nav-item">
          <router-link to="/calc" class="nav-link">Calculate Tax</router-link>
        </li>
        <li class="nav-item">
          <router-link to="/counter" class="nav-link">Counter</router-link>
        </li>
      </ul>
    </nav>
    <!-- <iterate/> -->

    <!-- Router View -->
    <router-view></router-view>
  </div>
</template>

<script setup>
import { RouterLink } from 'vue-router';
import Iterate from './components/iterate.vue';
</script>

<style scoped>
/* Navbar styles */
.navbar {
  background-color: #f8f9fa;
  padding: 10px 20px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  width: 100%;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 1000;
}

.navbar-nav {
  list-style: none;
  display: flex;
  margin: 0;
  padding: 0;
}

.nav-item {
  margin-right: 20px;
}

.nav-link {
  text-decoration: none;
  color: #333;
  transition: color 0.3s ease;
}

.nav-link:hover {
  color: #007bff;
}
</style>
