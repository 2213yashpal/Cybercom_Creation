import { createRouter, createWebHashHistory } from 'vue-router'; 
import counter from './components/counter.vue';
import home from './components/home.vue';
import cart from './components/cart.vue';
import studentlist from './views/studentlist.vue';

import pracbind from './components/pracbind.vue';

const routes = [
  { path: '/counter', component: counter },
  { path: '/pracbind', component: pracbind },
  {path: '/', component:home},
  {path: '/cart', component:cart},
  {path: '/students', component:studentlist}



  
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

export default router;
