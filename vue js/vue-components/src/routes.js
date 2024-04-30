import { createRouter, createWebHashHistory } from 'vue-router'; 

import App from './App.vue'

import objectprop from './views/objectprop.vue';
import home from './views/home.vue';
import slotparent from './components/slotparent.vue';
import allsubject from './components/allsubject.vue';
import postlist from './views/postlist.vue';


const routes = [
  { path: '/', component: home },
  { path: '/slot', component: slotparent },
  { path: '/allsubject', component: allsubject },
  { path: '/post', component: postlist }
  
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

export default router;
