import { createRouter, createWebHashHistory } from 'vue-router'; 

import App from './App.vue'

import objectprop from './views/objectprop.vue';
import home from './views/home.vue';

const routes = [
  { path: '/', component: home },




  
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

export default router;
