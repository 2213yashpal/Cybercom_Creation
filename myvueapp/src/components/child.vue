<template>
    <div>
      <h2>{{ name }}</h2>
      <ul>
        <li v-for="person in user" :key="person.email">
          {{ person.name }}  - {{ person.email }}
        </li>
      </ul>
      <button @click="getdata">Call function</button>
    </div>
  </template>
  
  <script>
  export default {
    name: "child",
    props: {
      name: String,
      user: Array,
      getdata: Function
    }
  };
  </script>
  