import { createRouter, createWebHashHistory } from 'vue-router'; 
import counter from './components/counter.vue';
import home from './components/home.vue';
import calctax from './components/calctax.vue';
import pracbind from './components/pracbind.vue';

const routes = [
  { path: '/counter', component: counter },
  { path: '/pracbind', component: pracbind },
  {path: '/', component:home},
  {path: '/calc', component:calctax}


  
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

export default router;
